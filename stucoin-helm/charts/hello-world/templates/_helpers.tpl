{{- define "hello_world.fullname" -}}
  {{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end -}}

{{- define "hello_world.labels" -}}
  app.kubernetes.io/name={{ include "hello_world.name" . }}
  app.kubernetes.io/instance={{ .Release.Name }}
{{- end -}}

{{- define "hello_world.selectorLabels" -}}
  {{- include "hello_world.labels" . | nindent 4 }}
{{- end -}}

{{- define "hello_world.name" -}}
  hello_world
{{- end -}}
