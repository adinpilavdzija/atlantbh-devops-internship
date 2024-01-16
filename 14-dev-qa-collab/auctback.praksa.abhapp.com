server {
    server_name auctback.praksa.abhapp.com www.auctback.praksa.abhapp.com;

    location / {
        proxy_pass http://localhost:8080/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/auctback.praksa.abhapp.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/auctback.praksa.abhapp.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}

server {
    if ($host = www.auctback.praksa.abhapp.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    if ($host = auctback.praksa.abhapp.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    listen 80;
    server_name auctback.praksa.abhapp.com www.auctback.praksa.abhapp.com;
    return 404; # managed by Certbot
}