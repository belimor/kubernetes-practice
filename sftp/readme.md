# Filebrowser
- https://filebrowser.org/
- https://filebrowser.org/installation
- https://filebrowser.org/features
### GitHub
- https://github.com/filebrowser/filebrowser
- https://github.com/filebrowser/filebrowser/blob/master/docker/root/defaults/settings.json
### DockerHub
- https://hub.docker.com/r/filebrowser/filebrowser

# Atmoz SFTP

### GitHub
- https://github.com/atmoz/sftp
### DockerHub
- https://hub.docker.com/r/atmoz/sftp/

```bash
mkpasswd -m sha-512 'your_password'
echo -n 'user_name:$6$...JsX.$6o...xg1:e:::ftp-file-storage' | base64
vim sftp-secret.yaml
"""
apiVersion: v1
kind: Secret
metadata:
  name: sftp-secret
type: Opaque
data:
  SFTP_USERS: dXN...nZQ==
"""
```
