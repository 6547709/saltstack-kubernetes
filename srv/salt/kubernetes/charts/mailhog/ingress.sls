mailhog-ingress:
  file.managed:
    - name: /srv/kubernetes/manifests/mailhog/ingress.yaml
    - source: salt://{{ tpldir }}/templates/ingress.yaml.j2
    - user: root
    - template: jinja
    - group: root
    - mode: "0644"
    - context:
      tpldir: {{ tpldir }}
  cmd.run:
      - watch:
        - file: /srv/kubernetes/manifests/mailhog/ingress.yaml
        - cmd: mailhog-namespace
      - runas: root
      - name: kubectl apply -f /srv/kubernetes/manifests/mailhog/ingress.yaml
