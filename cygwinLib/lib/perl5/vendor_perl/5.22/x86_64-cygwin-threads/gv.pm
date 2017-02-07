# This file was automatically generated by SWIG (http://www.swig.org).
# Version 3.0.5
#
# Do not make changes to this file unless you know what you are doing--modify
# the SWIG interface file instead.

package gv;
use base qw(Exporter);
use base qw(DynaLoader);
package gvc;
bootstrap gv;
package gv;
@EXPORT = qw();

# ---------- BASE METHODS -------------

package gv;

sub TIEHASH {
    my ($classname,$obj) = @_;
    return bless $obj, $classname;
}

sub CLEAR { }

sub FIRSTKEY { }

sub NEXTKEY { }

sub FETCH {
    my ($self,$field) = @_;
    my $member_func = "swig_${field}_get";
    $self->$member_func();
}

sub STORE {
    my ($self,$field,$newval) = @_;
    my $member_func = "swig_${field}_set";
    $self->$member_func($newval);
}

sub this {
    my $ptr = shift;
    return tied(%$ptr);
}


# ------- FUNCTION WRAPPERS --------

package gv;

*digraph = *gvc::digraph;
*strictgraph = *gvc::strictgraph;
*strictdigraph = *gvc::strictdigraph;
*readstring = *gvc::readstring;
*read = *gvc::read;
*graph = *gvc::graph;
*node = *gvc::node;
*edge = *gvc::edge;
*setv = *gvc::setv;
*getv = *gvc::getv;
*nameof = *gvc::nameof;
*findsubg = *gvc::findsubg;
*findnode = *gvc::findnode;
*findedge = *gvc::findedge;
*findattr = *gvc::findattr;
*headof = *gvc::headof;
*tailof = *gvc::tailof;
*graphof = *gvc::graphof;
*rootof = *gvc::rootof;
*protonode = *gvc::protonode;
*protoedge = *gvc::protoedge;
*ok = *gvc::ok;
*firstsubg = *gvc::firstsubg;
*nextsubg = *gvc::nextsubg;
*firstsupg = *gvc::firstsupg;
*nextsupg = *gvc::nextsupg;
*firstedge = *gvc::firstedge;
*nextedge = *gvc::nextedge;
*firstout = *gvc::firstout;
*nextout = *gvc::nextout;
*firsthead = *gvc::firsthead;
*nexthead = *gvc::nexthead;
*firstin = *gvc::firstin;
*nextin = *gvc::nextin;
*firsttail = *gvc::firsttail;
*nexttail = *gvc::nexttail;
*firstnode = *gvc::firstnode;
*nextnode = *gvc::nextnode;
*firstattr = *gvc::firstattr;
*nextattr = *gvc::nextattr;
*rm = *gvc::rm;
*layout = *gvc::layout;
*render = *gvc::render;
*renderresult = *gvc::renderresult;
*renderchannel = *gvc::renderchannel;
*renderdata = *gvc::renderdata;
*write = *gvc::write;

# ------- VARIABLE STUBS --------

package gv;

1;
