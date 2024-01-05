{{- define "bff.fullname" -}}
  {{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end -}}

{{- define "bff.labels" -}}
  app.kubernetes.io/name={{ include "bff.name" . }}
  app.kubernetes.io/instance={{ .Release.Name }}
{{- end -}}

{{- define "bff.selectorLabels" -}}
  {{- include "bff.labels" . | nindent 4 }}
{{- end -}}

{{- define "bff.name" -}}
  bff
{{- end -}}
