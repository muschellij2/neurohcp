
<!-- README.md is generated from README.Rmd. Please edit that file -->

# neurohcp: Human Connectome Project Interface

<!-- badges: start -->

[![R-CMD-check](https://github.com/muschellij2/neurohcp/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/muschellij2/neurohcp/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Downloads and reads data from Human ‘Connectome’ Project
<https://db.humanconnectome.org> using Amazon Web Services (‘AWS’) ‘S3’
buckets.

## Installation

You can install the development version of neurohcp from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("muschellij2/neurohcp")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(neurohcp)
hcp_list_dirs()
#> $get_result
#> Response [https://s3.amazonaws.com/hcp-openaccess/?delimiter=%2F&prefix=HCP%2F]
#>   Date: 2025-04-01 18:05
#>   Status: 200
#>   Content-Type: application/xml
#>   Size: 33.3 kB
#> <BINARY BODY>
#> 
#> $content
#> [1] "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<ListBucketResult xmlns=\"http://s3.amazonaws.com/doc/2006-03-01/\"><Name>hcp-openaccess</Name><Prefix>HCP/</Prefix><Marker></Marker><MaxKeys>1000</MaxKeys><Delimiter>/</Delimiter><IsTruncated>false</IsTruncated><Contents><Key>HCP/</Key><LastModified>2018-09-06T15:01:18.000Z</LastModified><ETag>&quot;d41d8cd98f00b204e9800998ecf8427e&quot;</ETag><Size>0</Size><Owner><ID>06afd4bd44a9517a0cb5d2e6f4ed986d70fd3aea99210ae3690142884c85d50b</ID><DisplayName>ccf-aws</DisplayName></Owner><StorageClass>STANDARD</StorageClass></Contents><Contents><Key>HCP/S500.txt</Key><LastModified>2018-08-16T00:26:10.000Z</LastModified><ETag>&quot;d1ee0e4fa4b3455b4ba62eedb90d1ec5&quot;</ETag><Size>3577</Size><Owner><ID>06afd4bd44a9517a0cb5d2e6f4ed986d70fd3aea99210ae3690142884c85d50b</ID><DisplayName>ccf-aws</DisplayName></Owner><StorageClass>STANDARD</StorageClass></Contents><Contents><Key>HCP/UR100.txt</Key><LastModified>2018-08-16T00:26:10.000Z</LastModified><ETag>&quot;f76224f77b652d716a3517253ec72776&quot;</ETag><Size>700</Size><Owner><ID>06afd4bd44a9517a0cb5d2e6f4ed986d70fd3aea99210ae3690142884c85d50b</ID><DisplayName>ccf-aws</DisplayName></Owner><StorageClass>STANDARD</StorageClass></Contents><CommonPrefixes><Prefix>HCP/100307/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/100408/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/101006/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/101107/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/101309/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/101410/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/101915/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/102008/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/102311/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/102816/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/103111/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/103414/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/103515/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/103818/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/104012/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/104820/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/105014/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/105115/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/105216/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/105923/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/106016/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/106319/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/106521/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/107321/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/107422/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/108121/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/108323/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/108525/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/108828/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/109123/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/109325/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/110411/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/111312/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/111413/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/111514/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/111716/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/112819/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/113215/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/113619/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/113821/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/113922/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/114419/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/114924/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/115320/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/116120/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/116524/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/117122/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/117324/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/118528/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/118730/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/118932/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/119833/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/120111/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/120212/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/120515/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/121315/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/121618/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/122317/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/122620/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/123117/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/123420/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/123925/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/124220/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/124422/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/124826/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/125525/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/126325/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/126628/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/126931/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/127630/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/127933/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/128127/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/128329/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/128632/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/129028/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/129432/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/129533/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/130013/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/130316/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/130922/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/131217/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/131621/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/131722/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/131924/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/132118/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/133019/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/133625/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/133827/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/133928/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/134324/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/135225/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/135528/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/135932/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/136227/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/136833/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/137027/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/137128/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/137633/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/137936/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/138231/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/138534/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/139233/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/139637/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/140117/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/140420/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/140824/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/140925/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/141422/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/141826/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/142424/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/142828/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/143325/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/143527/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/144226/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/144832/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/145531/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/145834/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/146129/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/146331/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/146432/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/147030/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/147737/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/148032/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/148335/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/148840/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/148941/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/149337/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/149539/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/149741/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/150423/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/150524/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/150625/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/150726/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/151223/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/151526/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/151627/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/151728/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/152831/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/153025/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/153429/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/153732/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/153833/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/154431/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/154734/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/154835/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/154936/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/155231/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/155635/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/156233/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/156334/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/156637/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/157336/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/157437/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/158035/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/158136/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/158540/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/159138/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/159239/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/159340/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/159441/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/160123/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/160830/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/161327/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/161630/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/161731/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/162026/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/162228/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/162329/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/162733/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/163129/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/163331/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/163432/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/163836/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/164030/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/164131/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/164939/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/165032/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/165234/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/165840/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/166438/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/167036/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/167743/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/168139/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/168341/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/169141/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/169343/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/169444/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/170934/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/171431/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/171633/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/172029/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/172130/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/172332/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/172534/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/172938/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/173132/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/173334/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/173435/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/173536/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/173940/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/175035/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/175439/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/175540/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/176542/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/177645/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/177746/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/178142/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/178748/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/178849/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/178950/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/179346/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/179548/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/180129/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/180432/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/180836/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/180937/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/181131/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/181232/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/182739/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/182840/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/183034/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/185139/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/185442/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/186141/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/187143/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/187547/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/187850/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/188347/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/189349/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/189450/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/190031/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/191033/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/191336/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/191437/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/191841/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/192439/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/192540/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/192641/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/192843/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/193239/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/194140/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/194645/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/194847/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/195041/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/195647/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/195849/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/196144/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/196750/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/197348/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/197449/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/197550/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/197651/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/198350/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/198451/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/198855/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/199150/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/199251/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/199453/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/199655/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/199958/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/200109/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/200614/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/201111/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/201414/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/201818/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/203418/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/204016/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/204521/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/205119/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/205220/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/205725/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/205826/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/207628/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/208024/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/208226/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/208327/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/208428/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/209834/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/209935/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/210011/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/210415/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/210617/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/211215/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/211316/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/211417/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/211720/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/211922/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/212116/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/212217/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/212318/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/212419/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/214019/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/214221/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/214423/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/214726/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/217126/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/217429/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/221319/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/224022/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/231928/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/233326/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/239944/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/245333/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/246133/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/249947/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/250427/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/250932/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/251833/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/255639/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/256540/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/268850/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/280739/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/284646/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/285345/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/285446/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/287248/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/289555/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/290136/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/293748/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/298051/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/298455/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/303119/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/303624/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/304020/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/307127/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/308331/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/310621/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/316633/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/329440/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/334635/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/339847/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/351938/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/352132/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/352738/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/355239/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/355542/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/356948/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/361941/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/365343/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/366042/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/366446/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/371843/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/377451/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/380036/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/382242/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/385450/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/386250/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/390645/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/395958/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/397154/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/397760/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/397861/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/412528/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/414229/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/415837/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/422632/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/433839/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/436239/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/436845/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/441939/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/445543/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/448347/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/465852/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/473952/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/475855/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/479762/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/480141/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/485757/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/486759/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/497865/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/499566/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/500222/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/510326/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/512835/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/519950/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/521331/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/522434/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/530635/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/531536/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/540436/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/541943/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/545345/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/547046/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/552544/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/559053/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/561242/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/562446/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/565452/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/566454/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/567052/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/567961/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/568963/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/570243/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/571548/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/573249/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/573451/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/579665/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/580044/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/580347/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/581349/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/583858/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/585862/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/586460/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/592455/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/594156/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/598568/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/599469/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/599671/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/601127/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/611231/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/613538/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/620434/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/622236/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/623844/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/627549/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/638049/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/644044/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/645551/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/650746/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/654754/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/660951/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/662551/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/665254/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/672756/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/673455/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/677968/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/679568/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/680957/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/683256/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/685058/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/687163/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/690152/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/695768/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/702133/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/704238/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/705341/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/709551/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/713239/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/715041/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/715647/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/715950/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/725751/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/729254/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/729557/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/732243/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/734045/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/742549/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/745555/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/748258/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/748662/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/749361/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/751348/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/753251/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/756055/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/759869/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/761957/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/765056/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/770352/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/771354/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/779370/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/782157/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/782561/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/783462/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/784565/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/786569/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/788876/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/789373/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/792564/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/792766/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/802844/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/814649/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/816653/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/825048/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/826353/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/826454/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/833148/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/833249/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/837560/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/837964/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/845458/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/849971/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/856766/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/857263/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/859671/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/861456/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/865363/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/871762/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/871964/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/872158/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/872764/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/877168/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/877269/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/885975/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/887373/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/889579/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/894673/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/896778/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/896879/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/898176/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/899885/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/901038/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/901139/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/901442/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/904044/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/907656/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/910241/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/912447/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/917255/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/922854/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/930449/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/932554/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/937160/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/951457/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/957974/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/958976/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/959574/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/965367/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/965771/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/978578/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/979984/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/983773/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/984472/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/987983/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/991267/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/992774/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>HCP/994273/</Prefix></CommonPrefixes></ListBucketResult>"
#> 
#> $parsed_result
#> $parsed_result$ListBucketResult
#> $parsed_result$ListBucketResult$Name
#> $parsed_result$ListBucketResult$Name[[1]]
#> [1] "hcp-openaccess"
#> 
#> 
#> $parsed_result$ListBucketResult$Prefix
#> $parsed_result$ListBucketResult$Prefix[[1]]
#> [1] "HCP/"
#> 
#> 
#> $parsed_result$ListBucketResult$Marker
#> list()
#> 
#> $parsed_result$ListBucketResult$MaxKeys
#> $parsed_result$ListBucketResult$MaxKeys[[1]]
#> [1] "1000"
#> 
#> 
#> $parsed_result$ListBucketResult$Delimiter
#> $parsed_result$ListBucketResult$Delimiter[[1]]
#> [1] "/"
#> 
#> 
#> $parsed_result$ListBucketResult$IsTruncated
#> $parsed_result$ListBucketResult$IsTruncated[[1]]
#> [1] "false"
#> 
#> 
#> $parsed_result$ListBucketResult$Contents
#> $parsed_result$ListBucketResult$Contents$Key
#> $parsed_result$ListBucketResult$Contents$Key[[1]]
#> [1] "HCP/"
#> 
#> 
#> $parsed_result$ListBucketResult$Contents$LastModified
#> $parsed_result$ListBucketResult$Contents$LastModified[[1]]
#> [1] "2018-09-06T15:01:18.000Z"
#> 
#> 
#> $parsed_result$ListBucketResult$Contents$ETag
#> $parsed_result$ListBucketResult$Contents$ETag[[1]]
#> [1] "\"d41d8cd98f00b204e9800998ecf8427e\""
#> 
#> 
#> $parsed_result$ListBucketResult$Contents$Size
#> $parsed_result$ListBucketResult$Contents$Size[[1]]
#> [1] "0"
#> 
#> 
#> $parsed_result$ListBucketResult$Contents$Owner
#> $parsed_result$ListBucketResult$Contents$Owner$ID
#> $parsed_result$ListBucketResult$Contents$Owner$ID[[1]]
#> [1] "06afd4bd44a9517a0cb5d2e6f4ed986d70fd3aea99210ae3690142884c85d50b"
#> 
#> 
#> $parsed_result$ListBucketResult$Contents$Owner$DisplayName
#> $parsed_result$ListBucketResult$Contents$Owner$DisplayName[[1]]
#> [1] "ccf-aws"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$Contents$StorageClass
#> $parsed_result$ListBucketResult$Contents$StorageClass[[1]]
#> [1] "STANDARD"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$Contents
#> $parsed_result$ListBucketResult$Contents$Key
#> $parsed_result$ListBucketResult$Contents$Key[[1]]
#> [1] "HCP/S500.txt"
#> 
#> 
#> $parsed_result$ListBucketResult$Contents$LastModified
#> $parsed_result$ListBucketResult$Contents$LastModified[[1]]
#> [1] "2018-08-16T00:26:10.000Z"
#> 
#> 
#> $parsed_result$ListBucketResult$Contents$ETag
#> $parsed_result$ListBucketResult$Contents$ETag[[1]]
#> [1] "\"d1ee0e4fa4b3455b4ba62eedb90d1ec5\""
#> 
#> 
#> $parsed_result$ListBucketResult$Contents$Size
#> $parsed_result$ListBucketResult$Contents$Size[[1]]
#> [1] "3577"
#> 
#> 
#> $parsed_result$ListBucketResult$Contents$Owner
#> $parsed_result$ListBucketResult$Contents$Owner$ID
#> $parsed_result$ListBucketResult$Contents$Owner$ID[[1]]
#> [1] "06afd4bd44a9517a0cb5d2e6f4ed986d70fd3aea99210ae3690142884c85d50b"
#> 
#> 
#> $parsed_result$ListBucketResult$Contents$Owner$DisplayName
#> $parsed_result$ListBucketResult$Contents$Owner$DisplayName[[1]]
#> [1] "ccf-aws"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$Contents$StorageClass
#> $parsed_result$ListBucketResult$Contents$StorageClass[[1]]
#> [1] "STANDARD"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$Contents
#> $parsed_result$ListBucketResult$Contents$Key
#> $parsed_result$ListBucketResult$Contents$Key[[1]]
#> [1] "HCP/UR100.txt"
#> 
#> 
#> $parsed_result$ListBucketResult$Contents$LastModified
#> $parsed_result$ListBucketResult$Contents$LastModified[[1]]
#> [1] "2018-08-16T00:26:10.000Z"
#> 
#> 
#> $parsed_result$ListBucketResult$Contents$ETag
#> $parsed_result$ListBucketResult$Contents$ETag[[1]]
#> [1] "\"f76224f77b652d716a3517253ec72776\""
#> 
#> 
#> $parsed_result$ListBucketResult$Contents$Size
#> $parsed_result$ListBucketResult$Contents$Size[[1]]
#> [1] "700"
#> 
#> 
#> $parsed_result$ListBucketResult$Contents$Owner
#> $parsed_result$ListBucketResult$Contents$Owner$ID
#> $parsed_result$ListBucketResult$Contents$Owner$ID[[1]]
#> [1] "06afd4bd44a9517a0cb5d2e6f4ed986d70fd3aea99210ae3690142884c85d50b"
#> 
#> 
#> $parsed_result$ListBucketResult$Contents$Owner$DisplayName
#> $parsed_result$ListBucketResult$Contents$Owner$DisplayName[[1]]
#> [1] "ccf-aws"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$Contents$StorageClass
#> $parsed_result$ListBucketResult$Contents$StorageClass[[1]]
#> [1] "STANDARD"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/100307/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/100408/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/101006/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/101107/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/101309/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/101410/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/101915/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/102008/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/102311/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/102816/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/103111/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/103414/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/103515/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/103818/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/104012/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/104820/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/105014/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/105115/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/105216/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/105923/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/106016/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/106319/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/106521/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/107321/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/107422/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/108121/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/108323/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/108525/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/108828/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/109123/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/109325/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/110411/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/111312/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/111413/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/111514/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/111716/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/112819/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/113215/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/113619/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/113821/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/113922/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/114419/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/114924/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/115320/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/116120/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/116524/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/117122/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/117324/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/118528/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/118730/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/118932/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/119833/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/120111/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/120212/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/120515/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/121315/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/121618/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/122317/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/122620/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/123117/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/123420/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/123925/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/124220/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/124422/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/124826/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/125525/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/126325/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/126628/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/126931/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/127630/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/127933/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/128127/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/128329/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/128632/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/129028/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/129432/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/129533/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/130013/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/130316/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/130922/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/131217/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/131621/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/131722/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/131924/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/132118/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/133019/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/133625/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/133827/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/133928/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/134324/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/135225/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/135528/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/135932/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/136227/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/136833/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/137027/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/137128/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/137633/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/137936/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/138231/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/138534/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/139233/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/139637/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/140117/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/140420/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/140824/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/140925/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/141422/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/141826/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/142424/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/142828/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/143325/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/143527/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/144226/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/144832/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/145531/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/145834/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/146129/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/146331/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/146432/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/147030/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/147737/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/148032/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/148335/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/148840/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/148941/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/149337/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/149539/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/149741/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/150423/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/150524/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/150625/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/150726/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/151223/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/151526/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/151627/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/151728/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/152831/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/153025/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/153429/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/153732/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/153833/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/154431/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/154734/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/154835/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/154936/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/155231/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/155635/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/156233/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/156334/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/156637/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/157336/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/157437/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/158035/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/158136/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/158540/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/159138/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/159239/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/159340/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/159441/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/160123/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/160830/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/161327/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/161630/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/161731/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/162026/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/162228/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/162329/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/162733/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/163129/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/163331/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/163432/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/163836/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/164030/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/164131/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/164939/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/165032/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/165234/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/165840/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/166438/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/167036/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/167743/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/168139/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/168341/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/169141/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/169343/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/169444/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/170934/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/171431/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/171633/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/172029/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/172130/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/172332/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/172534/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/172938/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/173132/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/173334/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/173435/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/173536/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/173940/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/175035/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/175439/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/175540/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/176542/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/177645/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/177746/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/178142/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/178748/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/178849/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/178950/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/179346/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/179548/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/180129/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/180432/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/180836/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/180937/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/181131/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/181232/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/182739/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/182840/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/183034/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/185139/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/185442/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/186141/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/187143/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/187547/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/187850/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/188347/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/189349/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/189450/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/190031/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/191033/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/191336/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/191437/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/191841/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/192439/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/192540/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/192641/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/192843/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/193239/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/194140/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/194645/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/194847/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/195041/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/195647/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/195849/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/196144/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/196750/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/197348/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/197449/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/197550/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/197651/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/198350/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/198451/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/198855/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/199150/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/199251/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/199453/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/199655/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/199958/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/200109/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/200614/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/201111/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/201414/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/201818/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/203418/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/204016/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/204521/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/205119/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/205220/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/205725/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/205826/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/207628/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/208024/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/208226/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/208327/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/208428/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/209834/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/209935/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/210011/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/210415/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/210617/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/211215/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/211316/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/211417/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/211720/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/211922/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/212116/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/212217/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/212318/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/212419/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/214019/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/214221/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/214423/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/214726/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/217126/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/217429/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/221319/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/224022/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/231928/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/233326/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/239944/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/245333/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/246133/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/249947/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/250427/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/250932/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/251833/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/255639/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/256540/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/268850/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/280739/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/284646/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/285345/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/285446/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/287248/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/289555/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/290136/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/293748/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/298051/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/298455/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/303119/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/303624/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/304020/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/307127/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/308331/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/310621/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/316633/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/329440/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/334635/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/339847/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/351938/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/352132/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/352738/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/355239/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/355542/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/356948/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/361941/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/365343/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/366042/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/366446/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/371843/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/377451/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/380036/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/382242/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/385450/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/386250/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/390645/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/395958/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/397154/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/397760/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/397861/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/412528/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/414229/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/415837/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/422632/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/433839/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/436239/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/436845/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/441939/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/445543/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/448347/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/465852/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/473952/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/475855/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/479762/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/480141/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/485757/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/486759/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/497865/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/499566/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/500222/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/510326/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/512835/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/519950/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/521331/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/522434/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/530635/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/531536/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/540436/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/541943/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/545345/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/547046/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/552544/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/559053/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/561242/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/562446/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/565452/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/566454/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/567052/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/567961/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/568963/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/570243/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/571548/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/573249/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/573451/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/579665/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/580044/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/580347/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/581349/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/583858/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/585862/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/586460/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/592455/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/594156/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/598568/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/599469/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/599671/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/601127/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/611231/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/613538/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/620434/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/622236/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/623844/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/627549/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/638049/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/644044/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/645551/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/650746/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/654754/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/660951/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/662551/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/665254/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/672756/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/673455/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/677968/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/679568/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/680957/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/683256/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/685058/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/687163/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/690152/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/695768/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/702133/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/704238/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/705341/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/709551/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/713239/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/715041/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/715647/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/715950/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/725751/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/729254/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/729557/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/732243/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/734045/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/742549/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/745555/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/748258/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/748662/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/749361/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/751348/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/753251/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/756055/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/759869/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/761957/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/765056/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/770352/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/771354/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/779370/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/782157/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/782561/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/783462/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/784565/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/786569/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/788876/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/789373/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/792564/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/792766/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/802844/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/814649/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/816653/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/825048/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/826353/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/826454/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/833148/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/833249/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/837560/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/837964/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/845458/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/849971/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/856766/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/857263/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/859671/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/861456/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/865363/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/871762/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/871964/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/872158/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/872764/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/877168/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/877269/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/885975/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/887373/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/889579/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/894673/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/896778/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/896879/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/898176/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/899885/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/901038/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/901139/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/901442/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/904044/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/907656/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/910241/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/912447/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/917255/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/922854/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/930449/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/932554/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/937160/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/951457/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/957974/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/958976/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/959574/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/965367/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/965771/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/978578/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/979984/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/983773/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/984472/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/987983/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/991267/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/992774/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "HCP/994273/"
#> 
#> 
#> 
#> attr(,"xmlns")
#> [1] "http://s3.amazonaws.com/doc/2006-03-01/"
fcp_list_dirs()
#> $get_result
#> Response [https://s3.amazonaws.com/fcp-indi/?delimiter=%2F&prefix=data%2FProjects%2F]
#>   Date: 2025-04-01 18:05
#>   Status: 200
#>   Content-Type: application/xml
#>   Size: 2.19 kB
#> <BINARY BODY>
#> 
#> $content
#> [1] "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<ListBucketResult xmlns=\"http://s3.amazonaws.com/doc/2006-03-01/\"><Name>fcp-indi</Name><Prefix>data/Projects/</Prefix><Marker></Marker><MaxKeys>1000</MaxKeys><Delimiter>/</Delimiter><IsTruncated>false</IsTruncated><CommonPrefixes><Prefix>data/Projects/ABIDE/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/ABIDE2/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/ABIDE_Initiative/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/ACPI/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/ADHD200/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/BASC/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/BGSP/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/CC_ME/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/CORR/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/CPAC_Regression_Test/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/CUNMET/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/CUNY_MADSEN/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/EEG_Eyetracking_CMI_data/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/EXVIVO/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/FCON1000/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/HBN/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/HBNSSI/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/HBN_EEG_MRI/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/INDI/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/NATVIEW_EEGFMRI/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/RBC/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/RBC_Surface/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/RocklandSample/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/RocklandSample2/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/UPENN/</Prefix></CommonPrefixes><CommonPrefixes><Prefix>data/Projects/narratives/</Prefix></CommonPrefixes></ListBucketResult>"
#> 
#> $parsed_result
#> $parsed_result$ListBucketResult
#> $parsed_result$ListBucketResult$Name
#> $parsed_result$ListBucketResult$Name[[1]]
#> [1] "fcp-indi"
#> 
#> 
#> $parsed_result$ListBucketResult$Prefix
#> $parsed_result$ListBucketResult$Prefix[[1]]
#> [1] "data/Projects/"
#> 
#> 
#> $parsed_result$ListBucketResult$Marker
#> list()
#> 
#> $parsed_result$ListBucketResult$MaxKeys
#> $parsed_result$ListBucketResult$MaxKeys[[1]]
#> [1] "1000"
#> 
#> 
#> $parsed_result$ListBucketResult$Delimiter
#> $parsed_result$ListBucketResult$Delimiter[[1]]
#> [1] "/"
#> 
#> 
#> $parsed_result$ListBucketResult$IsTruncated
#> $parsed_result$ListBucketResult$IsTruncated[[1]]
#> [1] "false"
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/ABIDE/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/ABIDE2/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/ABIDE_Initiative/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/ACPI/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/ADHD200/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/BASC/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/BGSP/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/CC_ME/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/CORR/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/CPAC_Regression_Test/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/CUNMET/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/CUNY_MADSEN/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/EEG_Eyetracking_CMI_data/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/EXVIVO/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/FCON1000/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/HBN/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/HBNSSI/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/HBN_EEG_MRI/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/INDI/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/NATVIEW_EEGFMRI/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/RBC/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/RBC_Surface/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/RocklandSample/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/RocklandSample2/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/UPENN/"
#> 
#> 
#> 
#> $parsed_result$ListBucketResult$CommonPrefixes
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix
#> $parsed_result$ListBucketResult$CommonPrefixes$Prefix[[1]]
#> [1] "data/Projects/narratives/"
#> 
#> 
#> 
#> attr(,"xmlns")
#> [1] "http://s3.amazonaws.com/doc/2006-03-01/"
```
