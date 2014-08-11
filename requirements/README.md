djangoSite
==========

Ubuntu 12.04
python==2.7.3
virtualenv==1.11.6

virtualenv myWorkspace
cd myWorkspace
source bin/activate

pip install -r https://raw.githubusercontent.com/kemalik/djangoSite/master/requirements/requirements.txt

cp src/djangosite/requirements/server.py lib/python2.7/site-packages/lettuce/django/
/* fix import module WSGIServerException https://github.com/gabrielfalcao/lettuce/commit/2d4de1f9f09009551e55c5274d63e13f556e873f */

cd src/djangosite/myPoll

python manage.py harvest