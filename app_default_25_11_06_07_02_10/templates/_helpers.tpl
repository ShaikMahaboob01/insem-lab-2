{{- define "event-management.labels" -}}
app.kubernetes.io/name: {{ include "event-management.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "event-management.name" -}}
event-management
{{- end }}

{{- define "event-management.fullname" -}}
{{ printf "%s-%s" .Release.Name (include "event-management.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "event-management.commonAnnotations" -}}
{{- if .Values.ingress.annotations }}
{{ toYaml .Values.ingress.annotations | nindent 4 }}
{{- end }}
{{- end }}
