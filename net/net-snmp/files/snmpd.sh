#!@RCD_SCRIPTS_SHELL@
#
# $NetBSD: snmpd.sh,v 1.2 2003/09/12 12:07:19 uebayasi Exp $
#
# PROVIDE: snmpd
# REQUIRE: DAEMON

if [ -f /etc/rc.subr ]; then
	. /etc/rc.subr
fi

name="snmpd"
rcvar=$name
command="@PREFIX@/sbin/${name}"
pidfile="/var/run/${name}.pid"
snmpd_flags="-s -S d"		# log using syslog LOG_DAEMON
command_args="-P ${pidfile}"

if [ -f @PKG_SYSCONFDIR@/snmpd.conf ]; then
	command_args="${command_args} -c @PKG_SYSCONFDIR@/snmpd.conf"
fi

if [ -f /etc/rc.subr -a -f /etc/rc.conf -a -f /etc/rc.d/DAEMON ]; then
        load_rc_config $name
        run_rc_command "$1"
else
	@ECHO@ -n " ${name}"
	${command} ${snmpd_flags} ${command_args}
fi
