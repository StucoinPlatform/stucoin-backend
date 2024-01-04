{{- define "hello-world.fullname" -}}
  {{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end -}}

{{- define "hello-world.labels" -}}
  app.kubernetes.io/name={{ include "hello-world.name" . }}
  app.kubernetes.io/instance={{ .Release.Name }}
{{- end -}}

{{- define "hello-world.selectorLabels" -}}
  {{- include "hello-world.labels" . | nindent 4 }}
{{- end -}}

{{- define "hello-world.name" -}}
  hello-world
{{- end -}}
