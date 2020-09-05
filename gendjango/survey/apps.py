from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class SurveyConfig(AppConfig):
    name = "gendjango.survey"
    verbose_name = _("Survey")

    def ready(self):
        try:
            import gendjango.survey.signals  # noqa F401
        except ImportError:
            pass
