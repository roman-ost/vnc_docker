FROM ubuntu

# Install vnc, xvfb in order to create a 'fake' display and firefox
RUN apt-get update && apt-get install -y x11vnc xvfb firefox software-properties-common
RUN add-apt-repository ppa:mdoyen/homebank
RUN apt-get update && apt-get install -y homebank

RUN mkdir ~/.vnc
# Setup a password
#RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
# Autostart firefox (might not be the best way, but it does the trick)
#RUN bash -c 'echo "firefox" >> /root/.bashrc'
RUN bash -c 'echo "homebank" >> /root/.bashrc'

EXPOSE 5900
#CMD    ["x11vnc", "-forever", "-usepw", "-create"]
CMD    ["x11vnc", "-forever", "-create"]

