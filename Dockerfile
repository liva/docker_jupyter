FROM jupyter/scipy-notebook

USER root
RUN set -x \
 && cd \
 && apt clean \
 && sed -i'~' -E "s@http://(..\.)?archive\.ubuntu\.com/ubuntu@http://pf.is.s.u-tokyo.ac.jp/~awamoto/apt-mirror/@g" /etc/apt/sources.list \
 && apt update \
 && apt install -y \
          fonts-ipafont-gothic \
	  fonts-ipaexfont-gothic \
	  fonts-ipafont-mincho \
	  fonts-ipaexfont-mincho \
 && apt clean \
 && rm -rf /var/lib/apt/lists/* \
 && apt -qy autoremove
USER jovyan
