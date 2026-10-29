# pfetch extension: network usage from vnstat.
#
# Sourced by pfetch via PF_SOURCE before it runs its info functions, so any
# 'get_*' defined here becomes usable as a PF_INFO entry.
#
#   PF_SOURCE=~/.config/pfetch/vnstat.sh \
#   PF_INFO="ascii title os host kernel uptime pkgs memory today month" pfetch
#
# Override the interface with PF_VNSTAT_IFACE, otherwise the interface of the
# default route is used, falling back to whichever interface vnstat knows about.

_pf_vnstat_iface=$PF_VNSTAT_IFACE

# 'route' on BSD/macOS, 'ip' on Linux.
[ "$_pf_vnstat_iface" ] || _pf_vnstat_iface=$(route -n get default 2>/dev/null |
    awk '/interface:/ { print $2; exit }')

[ "$_pf_vnstat_iface" ] || _pf_vnstat_iface=$(ip -o route get 1.1.1.1 2>/dev/null |
    awk '{ for (i = 1; i < NF; i++) if ($i == "dev") { print $(i + 1); exit } }')

# Last resort: the first interface vnstat has a database for.
[ "$_pf_vnstat_iface" ] || _pf_vnstat_iface=$(vnstat --json 2>/dev/null |
    sed -n 's/.*"name":"\([^"]*\)".*/\1/p' | head -1)

# One 'vnstat' call for both info functions.
#
# 'vnstat --oneline' emits a single semicolon separated line where fields
# 4/5/6 are today's rx/tx/total and fields 9/10/11 are this month's.
_pf_vnstat_line=$(vnstat --oneline -i "$_pf_vnstat_iface" 2>/dev/null)

# vnstat reports failures ('No interface matching ... found in database') on
# stdout rather than stderr, so discard anything that isn't a version 1
# '--oneline' record.
case $_pf_vnstat_line in
    1\;*\;*\;*\;*\;*\;*\;*\;*\;*\;*\;*\;*\;*\;*) ;;
    *) _pf_vnstat_line= ;;
esac

_pf_vnstat_field() {
    printf %s "$_pf_vnstat_line" | cut -d';' -f"$1"
}

get_today() {
    [ "$_pf_vnstat_line" ] || return

    log today "$(_pf_vnstat_field 6) ($(_pf_vnstat_field 4) down, $(_pf_vnstat_field 5) up)" >&6
}

get_month() {
    [ "$_pf_vnstat_line" ] || return

    log month "$(_pf_vnstat_field 11) ($(_pf_vnstat_field 9) down, $(_pf_vnstat_field 10) up)" >&6
}
