###########################################################################
#
# This file is auto-generated by the Perl DateTime Suite locale
# generator (0.05).  This code generator comes with the
# DateTime::Locale distribution in the tools/ directory, and is called
# generate-from-cldr.
#
# This file as generated from the CLDR XML locale data.  See the
# LICENSE.cldr file included in this distribution for license details.
#
# This file was generated from the source file lo_LA.xml
# The source file version number was 1.40, generated on
# 2009/05/05 23:06:38.
#
# Do not edit this file directly.
#
###########################################################################

package DateTime::Locale::lo_LA;

use strict;
use warnings;

our $VERSION = '0.46';

use utf8;

use base 'DateTime::Locale::lo';

sub cldr_version { return "1\.7\.1" }

{
    my $first_day_of_week = "7";
    sub first_day_of_week { return $first_day_of_week }
}

{
    my $glibc_date_format = "\%d\/\%m\/\%Ey";
    sub glibc_date_format { return $glibc_date_format }
}

{
    my $glibc_date_1_format = "\%a\ \%e\ \%b\ \%Ey\ \%H\:\%M\:\%S\ \%Z";
    sub glibc_date_1_format { return $glibc_date_1_format }
}

{
    my $glibc_datetime_format = "\%a\ \%e\ \%b\ \%Ey\,\ \%H\:\%M\:\%S";
    sub glibc_datetime_format { return $glibc_datetime_format }
}

{
    my $glibc_time_format = "\%H\:\%M\:\%S";
    sub glibc_time_format { return $glibc_time_format }
}

{
    my $glibc_time_12_format = "\%I\:\%M\:\%S\ \%p";
    sub glibc_time_12_format { return $glibc_time_12_format }
}

1;

__END__


=pod

=encoding utf8

=head1 NAME

DateTime::Locale::lo_LA

=head1 SYNOPSIS

  use DateTime;

  my $dt = DateTime->now( locale => 'lo_LA' );
  print $dt->month_name();

=head1 DESCRIPTION

This is the DateTime locale package for Lao Laos.

=head1 DATA

This locale inherits from the L<DateTime::Locale::lo> locale.

It contains the following data.

=head2 Days

=head3 Wide (format)

  ວັນຈັນ
  ວັນອັງຄານ
  ວັນພຸດ
  ວັນພະຫັດ
  ວັນສຸກ
  ວັນເສົາ
  ວັນອາທິດ

=head3 Abbreviated (format)

  ຈ.
  ອ.
  ພ.
  ພຫ.
  ສກ.
  ສ.
  ອາ.

=head3 Narrow (format)

  2
  3
  4
  5
  6
  7
  1

=head3 Wide (stand-alone)

  ວັນຈັນ
  ວັນອັງຄານ
  ວັນພຸດ
  ວັນພະຫັດ
  ວັນສຸກ
  ວັນເສົາ
  ວັນອາທິດ

=head3 Abbreviated (stand-alone)

  ຈ.
  ອ.
  ພ.
  ພຫ.
  ສກ.
  ສ.
  ອາ.

=head3 Narrow (stand-alone)

  2
  3
  4
  5
  6
  7
  1

=head2 Months

=head3 Wide (format)

  ມັງກອນ
  ກຸມພາ
  ມີນາ
  ເມສາ
  ພຶດສະພາ
  ມິຖຸນາ
  ກໍລະກົດ
  ສິງຫາ
  ກັນຍາ
  ຕຸລາ
  ພະຈິກ
  ທັນວາ

=head3 Abbreviated (format)

  ມ.ກ.
  ກ.ພ.
  ມີ.ນ.
  ມ.ສ..
  ພ.ພ.
  ມິ.ຖ.
  ກ.ລ.
  ສ.ຫ.
  ກ.ຍ.
  ຕ.ລ.
  ພ.ຈ.
  ທ.ວ.

=head3 Narrow (format)

  1
  2
  3
  4
  5
  6
  7
  8
  9
  10
  11
  12

=head3 Wide (stand-alone)

  ມັງກອນ
  ກຸມພາ
  ມີນາ
  ເມສາ
  ພຶດສະພາ
  ມິຖຸນາ
  ກໍລະກົດ
  ສິງຫາ
  ກັນຍາ
  ຕຸລາ
  ພະຈິກ
  ທັນວາ

=head3 Abbreviated (stand-alone)

  ມ.ກ.
  ກ.ພ.
  ມີ.ນ.
  ມ.ສ..
  ພ.ພ.
  ມິ.ຖ.
  ກ.ລ.
  ສ.ຫ.
  ກ.ຍ.
  ຕ.ລ.
  ພ.ຈ.
  ທ.ວ.

=head3 Narrow (stand-alone)

  1
  2
  3
  4
  5
  6
  7
  8
  9
  10
  11
  12

=head2 Quarters

=head3 Wide (format)

  Q1
  Q2
  Q3
  Q4

=head3 Abbreviated (format)

  Q1
  Q2
  Q3
  Q4

=head3 Narrow (format)

  1
  2
  3
  4

=head3 Wide (stand-alone)

  Q1
  Q2
  Q3
  Q4

=head3 Abbreviated (stand-alone)

  Q1
  Q2
  Q3
  Q4

=head3 Narrow (stand-alone)

  1
  2
  3
  4

=head2 Eras

=head3 Wide

  BCE
  CE

=head3 Abbreviated

  ປີກ່ອນຄິດສະການທີ່
  ຄ.ສ.

=head3 Narrow

  ປີກ່ອນຄິດສະການທີ່
  ຄ.ສ.

=head2 Date Formats

=head3 Full

   2008-02-05T18:30:30 = ວັນອັງຄານທີ 5 ກຸມພາ ຄ.ສ. 2008
   1995-12-22T09:05:02 = ວັນສຸກທີ 22 ທັນວາ ຄ.ສ. 1995
  -0010-09-15T04:44:23 = ວັນເສົາທີ 15 ກັນຍາ ປີກ່ອນຄິດສະການທີ່ -10

=head3 Long

   2008-02-05T18:30:30 = 5 ກຸມພາ 2008
   1995-12-22T09:05:02 = 22 ທັນວາ 1995
  -0010-09-15T04:44:23 = 15 ກັນຍາ -10

=head3 Medium

   2008-02-05T18:30:30 = 5 ກ.ພ. 2008
   1995-12-22T09:05:02 = 22 ທ.ວ. 1995
  -0010-09-15T04:44:23 = 15 ກ.ຍ. -10

=head3 Short

   2008-02-05T18:30:30 = 5/2/2008
   1995-12-22T09:05:02 = 22/12/1995
  -0010-09-15T04:44:23 = 15/9/-010

=head3 Default

   2008-02-05T18:30:30 = 5 ກ.ພ. 2008
   1995-12-22T09:05:02 = 22 ທ.ວ. 1995
  -0010-09-15T04:44:23 = 15 ກ.ຍ. -10

=head2 Time Formats

=head3 Full

   2008-02-05T18:30:30 = 18ໂມງ 30ນາທີ 30 ວິນາທີUTC
   1995-12-22T09:05:02 = 9ໂມງ 5ນາທີ 02 ວິນາທີUTC
  -0010-09-15T04:44:23 = 4ໂມງ 44ນາທີ 23 ວິນາທີUTC

=head3 Long

   2008-02-05T18:30:30 = 18 ໂມງ 30ນາທີ30 UTC
   1995-12-22T09:05:02 = 9 ໂມງ 5ນາທີ02 UTC
  -0010-09-15T04:44:23 = 4 ໂມງ 44ນາທີ23 UTC

=head3 Medium

   2008-02-05T18:30:30 = 18:30:30
   1995-12-22T09:05:02 = 9:05:02
  -0010-09-15T04:44:23 = 4:44:23

=head3 Short

   2008-02-05T18:30:30 = 18:30
   1995-12-22T09:05:02 = 9:05
  -0010-09-15T04:44:23 = 4:44

=head3 Default

   2008-02-05T18:30:30 = 18:30:30
   1995-12-22T09:05:02 = 9:05:02
  -0010-09-15T04:44:23 = 4:44:23

=head2 Datetime Formats

=head3 Full

   2008-02-05T18:30:30 = ວັນອັງຄານທີ 5 ກຸມພາ ຄ.ສ. 2008, 18ໂມງ 30ນາທີ 30 ວິນາທີUTC
   1995-12-22T09:05:02 = ວັນສຸກທີ 22 ທັນວາ ຄ.ສ. 1995, 9ໂມງ 5ນາທີ 02 ວິນາທີUTC
  -0010-09-15T04:44:23 = ວັນເສົາທີ 15 ກັນຍາ ປີກ່ອນຄິດສະການທີ່ -10, 4ໂມງ 44ນາທີ 23 ວິນາທີUTC

=head3 Long

   2008-02-05T18:30:30 = 5 ກຸມພາ 2008, 18 ໂມງ 30ນາທີ30 UTC
   1995-12-22T09:05:02 = 22 ທັນວາ 1995, 9 ໂມງ 5ນາທີ02 UTC
  -0010-09-15T04:44:23 = 15 ກັນຍາ -10, 4 ໂມງ 44ນາທີ23 UTC

=head3 Medium

   2008-02-05T18:30:30 = 5 ກ.ພ. 2008, 18:30:30
   1995-12-22T09:05:02 = 22 ທ.ວ. 1995, 9:05:02
  -0010-09-15T04:44:23 = 15 ກ.ຍ. -10, 4:44:23

=head3 Short

   2008-02-05T18:30:30 = 5/2/2008, 18:30
   1995-12-22T09:05:02 = 22/12/1995, 9:05
  -0010-09-15T04:44:23 = 15/9/-010, 4:44

=head3 Default

   2008-02-05T18:30:30 = 5 ກ.ພ. 2008, 18:30:30
   1995-12-22T09:05:02 = 22 ທ.ວ. 1995, 9:05:02
  -0010-09-15T04:44:23 = 15 ກ.ຍ. -10, 4:44:23

=head2 Available Formats

=head3 d (d)

   2008-02-05T18:30:30 = 5
   1995-12-22T09:05:02 = 22
  -0010-09-15T04:44:23 = 15

=head3 EEEd (d EEE)

   2008-02-05T18:30:30 = 5 ອ.
   1995-12-22T09:05:02 = 22 ສກ.
  -0010-09-15T04:44:23 = 15 ສ.

=head3 Hm (H:mm)

   2008-02-05T18:30:30 = 18:30
   1995-12-22T09:05:02 = 9:05
  -0010-09-15T04:44:23 = 4:44

=head3 hm (h:mm a)

   2008-02-05T18:30:30 = 6:30 ຫລັງທ່ຽງ
   1995-12-22T09:05:02 = 9:05 ກ່ອນທ່ຽງ
  -0010-09-15T04:44:23 = 4:44 ກ່ອນທ່ຽງ

=head3 Hms (H:mm:ss)

   2008-02-05T18:30:30 = 18:30:30
   1995-12-22T09:05:02 = 9:05:02
  -0010-09-15T04:44:23 = 4:44:23

=head3 hms (h:mm:ss a)

   2008-02-05T18:30:30 = 6:30:30 ຫລັງທ່ຽງ
   1995-12-22T09:05:02 = 9:05:02 ກ່ອນທ່ຽງ
  -0010-09-15T04:44:23 = 4:44:23 ກ່ອນທ່ຽງ

=head3 M (L)

   2008-02-05T18:30:30 = 2
   1995-12-22T09:05:02 = 12
  -0010-09-15T04:44:23 = 9

=head3 Md (d/M)

   2008-02-05T18:30:30 = 5/2
   1995-12-22T09:05:02 = 22/12
  -0010-09-15T04:44:23 = 15/9

=head3 MEd (E, M-d)

   2008-02-05T18:30:30 = ອ., 2-5
   1995-12-22T09:05:02 = ສກ., 12-22
  -0010-09-15T04:44:23 = ສ., 9-15

=head3 MMM (LLL)

   2008-02-05T18:30:30 = ກ.ພ.
   1995-12-22T09:05:02 = ທ.ວ.
  -0010-09-15T04:44:23 = ກ.ຍ.

=head3 MMMd (MMM d)

   2008-02-05T18:30:30 = ກ.ພ. 5
   1995-12-22T09:05:02 = ທ.ວ. 22
  -0010-09-15T04:44:23 = ກ.ຍ. 15

=head3 MMMEd (E MMM d)

   2008-02-05T18:30:30 = ອ. ກ.ພ. 5
   1995-12-22T09:05:02 = ສກ. ທ.ວ. 22
  -0010-09-15T04:44:23 = ສ. ກ.ຍ. 15

=head3 MMMMd (d MMMM)

   2008-02-05T18:30:30 = 5 ກຸມພາ
   1995-12-22T09:05:02 = 22 ທັນວາ
  -0010-09-15T04:44:23 = 15 ກັນຍາ

=head3 MMMMEd (E MMMM d)

   2008-02-05T18:30:30 = ອ. ກຸມພາ 5
   1995-12-22T09:05:02 = ສກ. ທັນວາ 22
  -0010-09-15T04:44:23 = ສ. ກັນຍາ 15

=head3 mmss (mm:ss)

   2008-02-05T18:30:30 = 30:30
   1995-12-22T09:05:02 = 05:02
  -0010-09-15T04:44:23 = 44:23

=head3 ms (mm:ss)

   2008-02-05T18:30:30 = 30:30
   1995-12-22T09:05:02 = 05:02
  -0010-09-15T04:44:23 = 44:23

=head3 y (y)

   2008-02-05T18:30:30 = 2008
   1995-12-22T09:05:02 = 1995
  -0010-09-15T04:44:23 = -10

=head3 yM (y-M)

   2008-02-05T18:30:30 = 2008-2
   1995-12-22T09:05:02 = 1995-12
  -0010-09-15T04:44:23 = -10-9

=head3 yMEd (EEE, y-M-d)

   2008-02-05T18:30:30 = ອ., 2008-2-5
   1995-12-22T09:05:02 = ສກ., 1995-12-22
  -0010-09-15T04:44:23 = ສ., -10-9-15

=head3 yMMM (y MMM)

   2008-02-05T18:30:30 = 2008 ກ.ພ.
   1995-12-22T09:05:02 = 1995 ທ.ວ.
  -0010-09-15T04:44:23 = -10 ກ.ຍ.

=head3 yMMMEd (EEE, y MMM d)

   2008-02-05T18:30:30 = ອ., 2008 ກ.ພ. 5
   1995-12-22T09:05:02 = ສກ., 1995 ທ.ວ. 22
  -0010-09-15T04:44:23 = ສ., -10 ກ.ຍ. 15

=head3 yMMMM (y MMMM)

   2008-02-05T18:30:30 = 2008 ກຸມພາ
   1995-12-22T09:05:02 = 1995 ທັນວາ
  -0010-09-15T04:44:23 = -10 ກັນຍາ

=head3 yQ (y Q)

   2008-02-05T18:30:30 = 2008 1
   1995-12-22T09:05:02 = 1995 4
  -0010-09-15T04:44:23 = -10 3

=head3 yQQQ (y QQQ)

   2008-02-05T18:30:30 = 2008 Q1
   1995-12-22T09:05:02 = 1995 Q4
  -0010-09-15T04:44:23 = -10 Q3

=head3 yyQ (Q yy)

   2008-02-05T18:30:30 = 1 08
   1995-12-22T09:05:02 = 4 95
  -0010-09-15T04:44:23 = 3 -10

=head3 yyyyM (M/yyyy)

   2008-02-05T18:30:30 = 2/2008
   1995-12-22T09:05:02 = 12/1995
  -0010-09-15T04:44:23 = 9/-010

=head3 yyyyMMMM (MMMM y)

   2008-02-05T18:30:30 = ກຸມພາ 2008
   1995-12-22T09:05:02 = ທັນວາ 1995
  -0010-09-15T04:44:23 = ກັນຍາ -10

=head2 Miscellaneous

=head3 Prefers 24 hour time?

Yes

=head3 Local first day of the week

ວັນອາທິດ


=head1 SUPPORT

See L<DateTime::Locale>.

=cut
