---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: true
showthedate: true
---

{{ if .Params.showthedate }}
<span class="post-date">{{ .Date.Format "Mon, Jan 2, 2006" }}</span>
{{ end }}
