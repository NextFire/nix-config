secrets-archive:
    tar cvfz secrets.tar.gz secrets/
    age -r age1p6dku6ru5c8u5enlzx2neg2l7l508adl3kxlq5mhpcjvx2vpt9gqjgjg7c secrets.tar.gz > secrets.tar.gz.age
    rm secrets.tar.gz

secrets-extract:
    age -d -i secrets.key.age secrets.tar.gz.age > secrets.tar.gz
    tar xvfz secrets.tar.gz
    rm secrets.tar.gz
