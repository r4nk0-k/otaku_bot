FROM ubuntu:20.04

RUN apt update
RUN apt install -y wget git
# install go
RUN wget https://dl.google.com/go/go1.13.5.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.13.5.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin

# install discord go
RUN go get github.com/bwmarrin/discordgo
COPY ./src/bot.go .

CMD ["go", "run", "bot.go"]