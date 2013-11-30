#!/usr/bin/perl

print "===== Symfony 2 cache warmup ===== \n";

($ARGV[0] && $ARGV[1]) || die("Usage: $0 [host] [symfony_dir]\n\n");
my $host = $ARGV[0];
my $symfony_dir = $ARGV[1];


print "Gathering the list of routes...\n";
my $routes = `$symfony_dir/app/console router:debug`;
my @routeList = split("\n", $routes);

shift(@routeList);
shift(@routeList);


print 0+@routeList, " routes found\n";

for my $route (@routeList) {
	my @routeList = split(" ", $route);

	my $curUrl = $routeList[4];

	if (!($curUrl =~ /{/)) {
		my $generatedUrl = 'http://' . $host . $curUrl;
		print "GET ", $generatedUrl, "\n";
		$a=`wget $generatedUrl --output-document=/dev/null -q`;
	}
}
