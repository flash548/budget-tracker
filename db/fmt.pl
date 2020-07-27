
# allows us to build out a list of insert statements 
# for the seed file from a .csv file

use strict;
use warnings;

use Time::Piece;

open my $fh, "<", "data1.csv";
open my $out, ">", "transactions.sql";

while (<$fh>) {
    chomp;
    my ($category, $date, $amount, $remarks) = split (/\t/);
    my $t = Time::Piece->strptime($date, "%m/%d/%y");
    print $out sprintf (<<HERE, $category, $t->strftime("%Y-%m-%d"), $amount, $remarks);
        INSERT INTO transactions (category, date, amount, remarks) 
            VALUES (
                (SELECT id FROM categories WHERE category = '%s'),
                '%s',
                %.2f,
                '%s');\n
HERE
    ;
}

