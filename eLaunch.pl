#!/usr/bin/perl
my $pattern= "/".$ARGV[0];
@paths=split(":",$ENV{"PATH"});
$id=0;
foreach $path (@paths) {
#    for $file (readdir(D)) {
#	print $file."\n";
#   }
    my @m_files=grep(/$pattern/, glob "$path/*");
    foreach $m_file(@m_files) {
	$result{$id}="$m_file";
	$id+=1;
    }
}
print "Id: $id\n";
print "Choose application\n";
print "==================\n";
foreach my $key (sort {$a<=>$b} keys %result) {
    print $key."  ==========>  ".$result{$key}."\n";
}
if($id!=0) {
    print "Enter id: ";
    $u_id =<STDIN>;
    chomp($u_id);
    $status=system("$result{$u_id}&");
}
exit(0);
