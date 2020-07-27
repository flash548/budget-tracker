
# allows us to build out a list of insert statements 
# for the seed file from a .csv file

use v6;
use Time::Piece:from<Perl5>;

my @in-lines = slurp("data1.csv").lines;
my $out = open "transactions.sql", :w;

for @in-lines -> $line {
    $line.chomp;
    my ($category, $date, $amount, $remarks) = $line.split(/\t/);
    my $t = Time::Piece.strptime($date, "%m/%d/%y");
    my $query = q:to/HERE/;
    INSERT INTO transactions (category, date, amount, remarks) 
                VALUES (
                    (SELECT id FROM categories WHERE category = '%s'),
                    '%s',
                    %.2f,
                    '%s');\n
    HERE

    $out.printf($query, $category, $t.strftime("%Y-%m-%d"), $amount, $remarks);
}