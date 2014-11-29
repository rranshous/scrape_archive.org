from ubuntu:14.04

RUN apt-get update
RUN apt-get install -y wget

ADD download_all_categories.sh /app/
ADD search_results.sh /app/
ADD categories.txt /app/
WORKDIR /app/

CMD /bin/bash -c "/app/download_all_categories.sh /out"
