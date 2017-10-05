$TopN = 10;
git rev-list --objects --all | 
	git cat-file --batch-check='%(objectsize), %(rest)' | 
	ConvertFrom-Csv -Header "Size", "Name" | 
	select -Property @{n='Size';e={[int]$_.Size}},* -Exclude Size |
	sort -Descending -Property Size |
	select-object -First $TopN |
	Format-Table -AutoSize;



