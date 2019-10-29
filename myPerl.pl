use Understand;

$db = Understand::open("E:/MyUnderstandProject.udb");
open(out, ">D:/results.csv");
print out "函数名称,相对路径,CountLineCode,CountPath,Cyclomatic,MaxNesting,Knots,CountInput,CountOutput\n";
foreach $func ($db->ents("Function ~unknown ~unresolved")) {
	print out $func->name(), ",",
		$func->ref("DefineIn")->file()->relname(), ",",
		$func->metric("CountLineCode"), ",", 
		$func->metric("CountPath"), ",",
		$func->metric("Cyclomatic"), ",",
		$func->metric("MaxNesting"), ",",
		$func->metric("Knots"), ",",
		$func->metric("CountInput"), ",",
		$func->metric("CountOutput"), "\n"
}
close out
