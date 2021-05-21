FROM opensciencegrid/software-base:release

LABEL maintainer OSG Software <support@opensciencegrid.org>

ENV LANG="en_US.utf8"
ENV LC_ALL="en_US.utf8"
ENV PYTHONUNBUFFERED=1


# Install core dependencies and configuration.


RUN yum update -y \
    && yum install -y httpd mod_auth_openidc mod_ssl python3-pip python3-mod_wsgi \
    && yum clean all \
    && rm -rf /var/cache/yum \
    #
    && python3 -m pip install --no-cache-dir -U pip setuptools wheel

COPY etc/supervisord.d/* /etc/supervisord.d/


# Install the Flask and WSGI applications.


COPY poetry.lock pyproject.toml requirements.txt /srv/
RUN python3 -m pip install --no-cache-dir -r /srv/requirements.txt

COPY run.sh wsgi.py /srv/
COPY registry /srv/registry/
