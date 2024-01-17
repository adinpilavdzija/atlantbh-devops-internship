server {
    server_name frontend.praksa.abhapp.com www.frontend.praksa.abhapp.com;

    location / {
        proxy_pass http://127.0.0.1:4200/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/frontend.praksa.abhapp.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/frontend.praksa.abhapp.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}

server {
    if ($host = www.frontend.praksa.abhapp.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    if ($host = frontend.praksa.abhapp.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    listen 80;
    server_name frontend.praksa.abhapp.com www.frontend.praksa.abhapp.com;
    return 404; # managed by Certbot
}
