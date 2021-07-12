FROM haskell:8.8.4
RUN mkdir strain
WORKDIR strain
COPY package.yaml package.yaml
COPY stack.yaml stack.yaml
RUN cabal update
RUN cabal install hspec
COPY test test
COPY src src
RUN stack build
RUN stack test
CMD ["stack", "test"]
