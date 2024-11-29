**Kobocoin**

https://github.com/validierungcc/kobocoin-docker

https://github.com/kobocoin/Kobocoin


minimal example compose.yaml

     ---
    services:
        kobocoin:
            container_name: kobocoin
            image: vfvalidierung/kobocoin:latest
            restart: unless-stopped
            ports:
                - '3893:3893'
                - '127.0.0.1:3341:3341'
            volumes:
                - 'kobocoin_data:/kobo/.Kobocoin'
    volumes:
       kobocoin_data:

**RPC Access**

    curl --user 'kobocoinrpc:<password>' --data-binary '{"jsonrpc":"2.0","id":"curltext","method":"getinfo","params":[]}' -H "Content-Type: application/json" http://127.0.0.1:3341
