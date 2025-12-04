FROM python:3.11-slim
WORKDIR /app
RUN pip install discord.py
RUN echo 'import discord' > bot.py
RUN echo 'import os' >> bot.py
RUN echo 'TOKEN = os.getenv("DISCORD_TOKEN")' >> bot.py
RUN echo 'if not TOKEN:' >> bot.py
RUN echo '    print("ERROR: No token")' >> bot.py  
RUN echo '    exit()' >> bot.py
RUN echo 'class Bot(discord.Client):' >> bot.py
RUN echo '    async def on_ready(self):' >> bot.py
RUN echo '        print(f"✅ Bot: {self.user}")' >> bot.py
RUN echo '    async def on_message(self, m):' >> bot.py
RUN echo '        if m.author == self.user: return' >> bot.py
RUN echo '        if "!ping" in m.content:' >> bot.py
RUN echo '            await m.channel.send("🏓 Pong!")' >> bot.py
RUN echo 'Bot(intents=discord.Intents.default()).run(TOKEN)' >> bot.py
CMD ["python", "bot.py"]