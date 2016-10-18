FROM ubuntu:trusty

# Create server directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Copy server
COPY . /usr/src/app

# Install server
RUN apt-get update
RUN apt-get install -y lib32gcc1
RUN ./steamcmd.sh +runscript update_tf2.txt

# Run
EXPOSE 27015 27020
CMD [ "tf2/srcds_run", "-console", "-game", "tf", "+sv_pure", "1", "+map", "koth_harvest", "+maxplayers", "24" ]