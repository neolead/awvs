FROM kalilinux/kali-rolling
#下载最新awvs安装包，并安装。
RUN apt-get update -y && \
    apt-get -y install libxdamage1 sudo bzip2 wget expect libgtk-3-0 libasound2 libnss3 libxss1 libx11-xcb1  libxcb-dri3-0 libgbm1 libdrm2 libdrm-dev libgbm-dev
RUN curl -s -o /tmp/awvs_latest.sh https://github.com/language90/awvs/releases/download/V0.1/awvs_latest.sh
RUN cd /tmp && \
	chmod +x awvs_latest.sh
RUN curl -s -o /tmp/install.expect https://github.com/language90/awvs/edit/main/install.expect
RUN cd /tmp && chmod +x /tmp/install.expect && expect /tmp/install.expect
#破解awvs，并开机自启。
RUN curl -s -o /awvs/awvs_crack.zip https://github.com/language90/awvs/edit/main/awvs_crack.zip
RUN unzip -o /awvs/awvs_crack.zip -d /home/acunetix/.acunetix/data/license/
RUN chmod 444 /home/acunetix/.acunetix/data/license/license_info.json
RUN chown acunetix:acunetix /home/acunetix/.acunetix/data/license/wa_data.dat
RUN rm /awvs/awvs_crack.zip
RUN echo '127.0.0.1 updates.acunetix.com' > /awvs/.hosts
RUN echo '127.0.0.1 erp.acunetix.com' >> /awvs/.hosts
CMD su -l acunetix -c /home/acunetix/.acunetix/start.sh








