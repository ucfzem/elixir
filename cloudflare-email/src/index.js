import { createMimeMessage } from "mimetext";

const FORWARD_TO = "toncompte@gmail.com";
const FROM_NAME = "Uzem";
const FROM_EMAIL = "contact@tondomaine.com";
const AUTOREPLY_SUBJECT_PREFIX = "Re: ";
const AUTOREPLY_BODY = `Merci pour votre message.

Je vous réponds sous 24 à 48 heures.

Bien cordialement,
Uzem`;

export default {
  async email(message, env, ctx) {
    await message.forward(FORWARD_TO);

    const reply = createMimeMessage();
    reply.setSender({ name: FROM_NAME, addr: FROM_EMAIL });
    reply.setRecipient(message.from);
    reply.setSubject(AUTOREPLY_SUBJECT_PREFIX + (message.headers.get("subject") || ""));

    const inReplyTo = message.headers.get("Message-ID") || message.headers.get("message-id");
    if (inReplyTo) {
      reply.setHeader("In-Reply-To", inReplyTo);
      reply.setHeader("References", inReplyTo);
    }

    reply.addMessage({
      contentType: "text/plain",
      data: AUTOREPLY_BODY,
    });

    const emailReply = new EmailMessage(
      FROM_EMAIL,
      message.from,
      reply.asRaw()
    );

    await message.reply(emailReply);
  },

  async fetch(request, env, ctx) {
    if (request.method === "POST" && new URL(request.url).pathname === "/send") {
      try {
        const { to, subject, text } = await request.json();
        if (!to || !subject || !text) {
          return new Response("Missing fields: to, subject, text", { status: 400 });
        }

        const msg = createMimeMessage();
        msg.setSender({ name: FROM_NAME, addr: FROM_EMAIL });
        msg.setRecipient(to);
        msg.setSubject(subject);
        msg.addMessage({
          contentType: "text/plain",
          data: text,
        });

        await env.EMAIL.send(msg.asRaw());

        return new Response(JSON.stringify({ success: true }), {
          headers: { "Content-Type": "application/json" },
        });
      } catch (err) {
        return new Response(JSON.stringify({ error: err.message }), {
          status: 500,
          headers: { "Content-Type": "application/json" },
        });
      }
    }

    return new Response("Email Worker OK", { status: 200 });
  },
};
