FROM ubuntu:20.04
RUN apt-get update && apt-get install -y curl unzip
RUN mkdir ~/Downloads
# Following link found from https://go.microsoft.com/fwlink/?linkid=2157202
# which was found from https://docs.microsoft.com/en-us/sql/tools/sqlpackage/sqlpackage-download
RUN curl https://download.microsoft.com/download/0/2/0/020aa2fa-f3f2-41ba-bacd-ff15557890d3/sqlpackage-linux-x64-en-US-15.0.5084.2.zip -o ~/Downloads/sqlpackage.zip
RUN mkdir ~/sqlpackage
RUN unzip ~/Downloads/sqlpackage.zip -d ~/sqlpackage
RUN echo "export PATH=\"\$PATH:$HOME/sqlpackage\"" >> ~/.bashrc
RUN chmod a+x ~/sqlpackage/sqlpackage
RUN /bin/bash -c "source ~/.bashrc"
RUN rm -rf ~/Downloads
RUN ln -s ~/sqlpackage/sqlpackage /usr/bin/sqlpackage
RUN apt-get update && apt-get install -y libunwind8 libicu66 sudo
CMD /bin/bash
