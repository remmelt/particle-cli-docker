# Particle CLI Development Server
# https://github.com/alexwitherspoon/particle-cli-docker
FROM alexwitherspoon/debian

MAINTAINER Alex Witherspoon <alex@alexwitherspoon.com>

# ENVs
ENV LC_ALL en_US.UTF-8

# Commands to Stage OS
RUN echo "Installing Base Utilties" && \
    bash -c "apt-get update -qq" && \
    bash -c "apt-get install -qq --force-yes build-essential git nano ssh" && \
    bash -c "echo 'root:particle' | chpasswd" && \
    bash -c "apt-get autoremove -qq --force-yes" && \
    bash -c "apt-get clean -qq --force-yes" && \
    echo "Base Utilities Installed" && \
    echo "...."

# Commands to Stage App  
RUN echo "Installing node.js" && \
    bash -c "apt-get update -qq" && \
    bash -c "apt-get install -qq --force-yes curl" && \
    bash -c "curl -sL https://deb.nodesource.com/setup | bash -" && \
    bash -c "apt-get install -qq --force-yes nodejs" && \
    bash -c "npm cache clean -f" && \
    bash -c "npm install -g n" && \
    bash -c "n stable" && \
    bash -c "apt-get autoremove -qq --force-yes" && \
    bash -c "apt-get clean -qq --force-yes" && \
    echo "node.js Installed" && \
    echo "...."

RUN echo "Installing particle-cli" && \
    bash -c "npm install -g particle-cli" && \
    echo "particle-cli Installed" && \
    echo "...."

# Network Ports Used by App
EXPOSE 22

# Commands to Run App
CMD bash -c "/etc/init.d/ssh start" && \
    bash -c "sleep 365d"
