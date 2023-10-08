FROM alpine:3.16

ARG FTP_USER
ARG FTP_PASS

RUN apk update && apk add --no-cache vsftpd

RUN sed -i 's#anonymous_enable=YES#anonymous_enable=NO#' /etc/vsftpd/vsftpd.conf \
&&  sed -i 's/#local_enable=YES/local_enable=YES/' /etc/vsftpd/vsftpd.conf \
&& sed -i 's/#write_enable=YES/write_enable=YES/' /etc/vsftpd/vsftpd.conf \
&& sed -i 's/#local_umask=022/local_umask=022/' /etc/vsftpd/vsftpd.conf \
&& sed -i 's@#xferlog_file=/var/log/vsftpd.log@xferlog_file=/var/log/vsftpd.log@' /etc/vsftpd/vsftpd.conf \
&& sed -i 's/#xferlog_std_format=YES/xferlog_std_format=YES/' /etc/vsftpd/vsftpd.conf \
&& echo "pasv_enable=YES" >> /etc/vsftpd/vsftpd.conf \
&& echo "pasv_min_port=30000" >> /etc/vsftpd/vsftpd.conf \
&& echo "pasv_max_port=30009" >> /etc/vsftpd/vsftpd.conf \
&& echo "local_root=/var/www/html/" >> /etc/vsftpd/vsftpd.conf \
&& echo "log_ftp_protocol=YES" >> /etc/vsftpd/vsftpd.conf \
&& echo 'seccomp_sandbox=NO' >> /etc/vsftpd/vsftpd.conf

RUN adduser -D ftpuser && echo "$FTP_USER:$FTP_PASS" | chpasswd && adduser ftpuser root

CMD sh -c "vsftpd /etc/vsftpd/vsftpd.conf"
