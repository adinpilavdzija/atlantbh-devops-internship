server {
    server_name backend.praksa.abhapp.com www.backend.praksa.abhapp.com;

    location / {
        proxy_pass http://localhost:9966/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location = / {
         return 301 /petclinic/;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/backend.praksa.abhapp.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/backend.praksa.abhapp.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}

server {
    if ($host = www.backend.praksa.abhapp.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    if ($host = backend.praksa.abhapp.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    listen 80;
    server_name backend.praksa.abhapp.com www.backend.praksa.abhapp.com;
    return 404; # managed by Certbot
}
