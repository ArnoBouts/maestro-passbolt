FROM passbolt/passbolt

COPY wait-for-mariadb.sh /wait-for-mariadb.sh

CMD ["/docker-entrypoint.sh"]

ENTRYPOINT ["/wait-for-mariadb.sh"]
