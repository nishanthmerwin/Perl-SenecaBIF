# program:      a1test.pl
# purpose:      driver program to test BIF712A assignment #1 (FALL 2015)
# written by:   danny abesdris
# date:         october 8, 2015

# NOTE:         You may not modify this file!

# run format:   a1test.pl assign1.pl
#               assign1.pl (name of YOUR perl program)

# INSTRUCTIONS: (PLEASE READ CAREFULLY)!
#
#               First, please make sure you have an active INTERNET connection.
#
#               Second, you MUST install a special Perl module named "Shell" on YOUR OWN Perl
#               distribution (the command below WILL NOT WORK on Seneca's Perl distribution
#               or any Perl distribution for which you do not have ADMINISTRATOR rights)
#               (i.e. YOU MUST INSTALL the "Shell" module on your own personal Perl installation).
#
#               On your laptop or other personal computer where Perl is already installed
#               Run the following command:
#                                         perl -MCPAN -e "install Shell"
#
#               You should receive a message stating that the "Shell" module installed successfully
#               and that all tests ran successfully.
#
#               Next, copy this file (a1test.pl) into the directory
#               where your solution to assignment #1 is located (assuming a file name of "assign1.pl")
#
#               NOTE: Your solution to assignment #1 MUST accept the RAW DNA string as a command line
#               argument stored in the array @ARGV (i.e. the RAW DNA string must be located in $ARGV[0]).
#               You may access this string in YOUR program by storing it in a variable as:
#                                         my $rawDna = $ARGV[0];
#
#               Now execute the following command:
#                                         perl a1test.pl assign1.pl
#
#               (where 'assign1.pl' is the name of YOUR Perl program that contains the solution to
#               assignment #1).
#
#               The program's output will attempt to indicate if your assignment is complete
#               or still needs to be fixed in some way.
#               Please take note of any messages which are displayed as
#               they *may* indicate where your program may have encountered an error.

use strict;
use warnings;
use Shell;

sub test;

my ($raw1, $raw2, $raw3);

# 102 random amino acids
$raw1 = "________1_caatgttcaa_acactttgtg_aagctctgtt_agctgatggt_cttgctaaag_catttcctag" .
"XXXXXXXXXXXXXXXX" .
"_______61_caatatgatg_gtagtcacag_agcgtgagca_aaaagaaagc_ttattgcatc_aagcatcatg" .
"PPPPPPPPPPPPPPPPPPPPP" .
"______121_gcaccacaca_agtgatgatt_ttggtgagca_tgccacagtt_agagggagta_gctttgtaac" .
"88888888888888888888888" .
"______181_tgatttagag_aaatacaatc_ttgcatttag_atatgagttt_acagcacctt_ttatagaata" .
"222222222222222222222222" .
"______241_ttgtaaccgt_tgctatggtg_ttaagaatgt_ttttaattgg_atgcattata_caatcccaca" .
"QQQQQQQQQQQQQQQQQQQQQQQQQQQ" .
"wwwwwwwwwwwwwwww!!!!!!!!!!!!!!!!!!!!!!!!" .
"!!!!!!11xxxxxxxxxxxxxxxxxx~~~~~~~~~~~~~~~~~" .
")(*********************~~~~~~~~~~~~~~~~~~~~~YYYYYYYYYYYYYYYYYYYYY" .
"______301_gtgttat"  .
"______" .
"//" .
"7777777777777777777777777777777777MMMMMMMMMMMMMM";


# DNA for drosophila genome
$raw2 = "ORIJIN______" .
"________1_tgtctgcaca_gacagcacca_tgtcgctcat_ggtcgtcagc_atggcgtgtg_ttgggttctt" .
"_______61_cttgctgcag_ggggcctggc_cacatgaggg_agtccacaga_aaaccttccc_tcctggccca" .
"______121_cccaggtccc_ctggtgaaat_cagaagagac_agtcatcctg_caatgttggt_cagatgtcag" .
"______181_gtttgagcac_ttccttctgc_acagagaggg_gaagtataag_gacactttgc_acctcattgg" .
"______241_agagcaccat_gatggggtct_ccaaggccaa_cttctccatc_ggtcccatga_tgcaagacct" .
"______301_tgcagggacc_tacagatgct_acggttctgt_tactcactcc_ccctatcagt_tgtcagctcc" .
"______361_cagtgaccct_ctggacatcg_tcatcacagg_tctatatgag_aaaccttctc_tctcagccca" .
"______421_gccgggcccc_acggttttgg_caggagagag_cgtgaccttg_tcctgcagct_cccggagctc" .
"______481_ctatgacatg_taccatctat_ccagggaggg_ggaggcccat_gaacgtaggt_tctctgcagg" .
"______541_gcccaaggtc_aacggaacat_tccaggccga_ctttcctctg_ggccctgcca_cccacggagg" .
"______601_aacctacaga_tgcttcggct_ctttccgtga_ctctccctat_gagtggtcaa_actcgagtga" .
"______661_cccactgctt_gtttctgtca_caggaaaccc_ttcaaatagt_tggccttcac_ccactgaacc" .
"______721_aagctccaaa_accggtaacc_ccagacacct_gcatgttctg_attgggacct_cagtggtcaa" .
"______781_aatccctttc_accatcctcc_tcttctttct_ccttcatcgc_tggtgctcca_acaaaaaaaa" .
"______841_tgctgctgta_atggaccaag_agcctgcagg_gaacagaaca_gtgaacagcg_aggattctga" .
"______901_tgaacaagac_catcaggagg_tgtcatacgc_ataattggat_cactgtgttt_tcacacagag" .
"______961_aaaaatcact_cgcccttctg_agaggcccaa_gacaccccca_acagatacca_gcatgtacat" .
"_____1021_agaacttcca_aatgctgagc_ccagatccaa_agttgtcttc_tgtccacgag_caccacagtc" .
"_____1081_aggccttgag_gggatcttct_agggagacaa_cagccctgtc_tcaaaaccgg_gttgccagct" .
"_____1141_cccatgtacc_agcagctgga_atctgaaggc_atcagtcttc_atcttagggc_atcgctcttc" .
"_____1201_ctcacaccac_gaatctgaac_atgcctctct_cttgcttaca_aatgtctaag_gtccccactg" .
"_____1261_cctgctggag_agaaaacaca_ctcctttgct_tagcccacaa_ttctccattt_cacttgaccc" .
"_____1321_ctgcccacct_ctccaaccta_actggcttac_ttcctagtct_acctgaggct_gcaatcacac" .
"_____1381_tgaggaactc_acaattccaa_acatacaaga_ggctgcctct_taacacagca_cttagacacg" .
"_____1441_tgctgttcca_cctcccttca_gactatcttt_cagccttctg_ccagcagtaa_aacttataaa" .
"_____1501_ttttttaaat_aatttcaatg_tagttttccc_gccttcaaat_aaacatgtct_gccctcatg" .
"//";

#  DNA for alpha & beta chains of insulin peptide
$raw3 = "?????????????????????????????xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" .
"yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy" .
"" .
"ORIJIN______" .
"________1_ctaagtactt_tcatagacaa_caccattcca_gaatttcagg_atgaatgggg_atatgcccca" .
"_______61_tgtccccatc_actactcttg_cggggattgc_tagtctcaca_gacctcctga_accagctgcc" .
"______121_tcttccatcc_cctttacctg_ctacaactac_aaagagcctt_ctctttaatg_cacgaatagc" .
"______181_agaagaggtg_aactgccttt_tggcctgtag_ggatgataat_ttggtttcac_agcttgtcca" .
"______241_tagcctcaac_caagtatcaa_cagatcacat_agaattgaaa_gataaccttg_gcagtgatga" .
"______301_tccagaaggc_gacataccag_tcttgttgca_ggccgtcctg_gcaaggagtc_ctaacgtttt" .
"______361_cagggagaaa_agtatgcaga_acagatatgt_acaaagtgga_atgatgatgt_ctcagtataa" .
"______421_actttctcag_aattccatgc_acagtagtcc_tgcatcttcc_aattatcagc_aaaccactat" .
"______481_ctcacatagt_ccctccagcc_ggtttgtgcc_accacagaca_agctctggga_acagatttat" .
"______541_gccacaacaa_aatagcccag_tgcctagccc_atatgcccca_caaagccctg_caggatacat" .
"______601_gccatattcc_catccttcaa_gttatacaac_acatccacag_atgcagcaag_catcggtatc" .
"______661_aagtcccatt_gttgcaggtg_gtttgagaaa_cctacatgat_aataaagttt_ctggttcgtt" .
"______721_gtctggcaat_tctgctaatc_atcatgctga_taatcctaga_catggctcaa_gtgacgacta" .
"______781_cctacacatg_gtgcacaggc_taagtagtga_cgatggagat_tcttcaacaa_tgaggaatgc" .
"______841_tgcatctttt_cccttgaggt_ctccacagcc_agtgtgttcc_cctgctggaa_gtgatggaac" .
"______901_tccaaaagga_tcaagaccac_ctttaattct_acagtctcag_tctctacctt_gttcatcacc" .
"______961_tcgagatgtt_ccaccagaca_tcttgttaga_ttctccagaa_agaaaacaaa_agaagcaaaa" .
"_____1021_gaaaatgaaa_ttaggcaagg_atgaaaaaga_ccagagtgag_aaagctgcaa_tgtatgatat" .
"_____" .
"_____" .
"?????????????????????????????xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" .
"yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy" .
"_____" .
"_____" .
"_____1081_cattagctct_ccatccaagg_actcaactaa_acttacgtta_agactttctc_gtgtaaggtc" .
"_____1141_ttcagatatg_gaccagcaag_aggatatgct_ttctggtatg_gaaaatagca_atgtttcaga" .
"_____1201_aaatgatatt_ccttttaatg_tgcagtaccc_aggacagact_tcaaaaacac_ccattactcc" .
"_____1261_acaggatgta_aaccgcccac_taaatgctgc_acagtgttta_tcgcagcaag_aacaaacagc" .
"_____1321_attccttcca_gcaaatcaag_tgcctgtttt_acaacagaac_acttcagttg_ctacgaaaca" .
"_____1381_gccccagact_tctgtggtac_agaaccagca_acaggtatca_caacagggac_ctatatatga" .
"_____1441_tgaagtggaa_ttggatgcat_tggctgaaat_tgagcgaata_gagagagaat_cagctattga" .
"_____1501_aagggagcgt_ttttcaaaag_aagttcaaga_taaagataag_cctttgaaaa_aaagaaaaca" .
"_____1561_agattcttac_ccacaggagg_ctgggggtgc_tacaggaggt_aatagaccag_cttctcagga" .
"_____1621_gacgggttct_acgggaaatg_ggtcaaggcc_agcattaatg_gttagcattg_atcttcatca" .
"_____1681_ggcaggaaga_gtggactctc_aggcttctgt_aactcaggat_tcagactcca_taaaaaagcc" .
"_____1741_tgaagaaatc_aaacaatgta_atgatgcacc_tatttctgtt_cttcaggaag_atattattgg" .
"_____1801_aaatcttaaa_tctacaccag_aaaaccatcc_tgagactcct_aaaaaaaagt_ctgatcctga" .
"_____1861_gctttcaaag_aatgaaatga_aacaaaatga_aagtagattg_gcagaatcta_aaccaaatga" .
"_____1921_aaacagattg_gtagagacaa_aatctagtga_aagtaagtta_gatactaaaa_ttgagataca" .
"_____1981_aacagaagaa_cctaaacaga_atgagagcag_aacgattgaa_tccaagcaaa_atgagagcac" .
"_____2041_cacagccgag_cctaaacaga_atgaaaatag_actgtctgac_acaaaaccaa_atgacaacaa" .
"_____2101_acaaaataat_ggtagatcag_aaacagcaaa_gtcaagacct_gaaaccccaa_agcaaaaggg" .
"_____2161_tgaaagccga_cctgaaactc_caaaacaaaa_gagtgagggg_cgtcctgaaa_ccccaaagca" .
"_____2221_aaagggcgat_ggacggcctg_aaactccaaa_gcagaaaggt_gagggccgac_ctgaaactcc" .
"_____2281_aaagcaaaaa_aatgaaggtc_gtcctgaaac_accaaaacat_agacatgaaa_ataggaggga" .
"_____2341_tcctggaaaa_ccatcaacag_agaaaaaacc_tgaaatgtct_aaacataaac_aggatattaa" .
"_____2401_atccgattca_cctcggttaa_aatcagaaag_agctgaagcc_ttaaagcaga_gacctgatgg" .
"_____2461_gcgatctgtt_tctgagtcac_taagacgtga_ccatgatagt_aaacaaaagt_cagatgacag" .
"_____2521_gagtgaatct_gagcgacatc_gaggtgatca_atctagggtt_cgaagaccag_aaacattgag" .
"_____2581_atcctctagt_agaaatgaac_atggcattaa_atctgatggt_tcaaaacctg_ataaactaga" .
"_____2641_aagaaaacac_agacatgaat_caggggactc_aagggaaaga_ctgtcttctg_gggagcagaa" .
"_____2701_atcaagacct_gacagtcctc_gtgttaaaca_aggagattct_aataaatcaa_gacctgataa" .
"_____2761_gcctggtttt_aaatcaccaa_atagtaaaga_tgacaaaagg_acagaaggca_acaagagtaa" .
"_____2821_aatagacagt_aataaaacgc_accctgacaa_taaggcagaa_tttccaagtt_atttgttggg" .
"_____2881_gggcaggtct_ggtgcattga_aaaattttgt_cattccaaaa_atcaagaggg_ataaagatgg" .
"_____2941_caatgttact_caggagacaa_agaaaatgga_aatgaaagga_gagcagaaag_acaaagtaga" .
"_____3001_aaaaatggga_ttagttgaag_atctaaataa_aggagctaag_cctgtagttg_ttctgcaaaa" .
"_____3061_actgtctttg_gatgatgttc_agaaacttat_taaagataga_gaggataaat_caagaagttc" .
"_____3121_ccttaaacct_atcaagaata_aaccatcaaa_atcaaataaa_ggtagtatag_atcaatcagt" .
"_____3181_gttaaaagaa_ttaccccctg_aactcctggc_agaaattgaa_tctaccatgc_cactttgtga" .
"_____3241_acgtgtgaaa_atgaataaac_gcaagcgtag_cacagttaat_gaaaagccaa_aatatgctga" .
"_____3301_aatcagttca_gatgaagata_atgatagtga_tgaagctttt_gaatcctcta_ggaaacgaca" .
"_____3361_taaaaaagat_gatgataaag_cttgggaata_tgaagagcgt_gacagaagaa_gctctgggga" .
"_____3421_tcataggaga_agtggccact_ctcatgaagg_aagaaggagt_tcgggtggtg_gtcgttatcg" .
"_____3481_aaaccgaagt_ccatcagatt_ctgacatgga_agattattct_cctcctccca_gccttagtga" .
"_____3541_ggttgctaga_aaaatgaaga_aaaaagaaaa_acagaagaag_cggaaagctt_atgaaccaaa" .
"_____3601_actaacacct_gaagaaatga_tggattcttc_aacttttaag_agattcacag_cctcaataga" .
"_____3661_aaatattttg_gataatttag_aagatatgga_ttttactgca_tttggtgatg_atgatgaaat" .
"_____3721_ccctcaggaa_ctgctcttag_gaaaacatca_gcttaatgaa_ctcggcagtg_aatctgctaa" .
"_____3781_aattaaagca_atgggtataa_tggataagct_ttccactgac_aaaactgtga_aagtcctaaa" .
"_____3841_tatcttggag_aagaatattc_aagatgggtc_aaagctctcc_actttgttaa_atcatattcc" .
"_____" .
"_____" .
"_____" .
"_____" .
"?????????????????????????????xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" .
"yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy____" .
"_____" .
"_____" .
"_____" .
"_____3901_gctggcccgc_ggcctgcact_ctccgccggg_cctacgcctc_cccggccgcc_cggcaggagc" .
"_____3961_ccagtccccg_ccaccggagc_cggccgggag_agggtacaaa_accaccgcca_cccagggcgg" .
"_____4021_ctgccaccag_agaggagcga_actctagact_cgcccgtgga_ggagacctgg_ggccgctaag" .
"_____4081_gaaacggccg_ggaggggagc_gaggaggaga_gacgctgagg_acctggcgcc_gccgccgccg" .
"_____4141_ccgccgaaat_aaagagcagg_aatttacctg_gtgcggggaa_catgtagagc_cggggggaga" .
"_____4201_ccagccgaga_agacaaatcg_ctgcttcttc_ttcctcctcc_tcctccttct_cccacataga" .
"_____4261_aacactcgca_aacacccgac_caggggcccg_agctaccggg_ggggcatcgc_cgccggcccg" .
"_____4321_ggaaccaatc_ctcctgtcgg_cgggggcgtc_cctccctgcg_gcttggtggt_gtcgggtgag" .
"_____4381_tcggtaccga_cggagggagg_ggggggaggg_cgggggggga_aaggagccct_gtgtgtgtct" .
"_____4441_ctctctctcg_ttccgtctct_ccctcgcaga_acaaaatgcc_gaccggaagt_gcagctgcag" .
"_____4501_gaatgactcc_ctccgccggc_gccaaacact_aacaaccacc_ccctcttccc_cactccactt" .
"_____4561_ccgccaccgc_cgcgccgccg_ccaccacttc_agctcgcgtc_ctcggccgcg_ccggactgca" .
"_____4621_cggcccgcgc_ctctccgcac_cgcaccccgg_cccggcggcg_gccggcagcc_ggcagagagc" .
"_____4681_aggcggtggt_tctcttctgc_gcctttctcc_tcctcagggc_ggctgtggat_gttgcctttt" .
"_____4741_attgtcgatc_ctacgtagcg_gcgttttcgc_tgcggcacgg_acgggccggg_tcttcctgtt" .
"_____4801_ctttattttc_ctggaggccg_accggagcgg_gccccgagtt_cggtggtggt_cgtgtgcgtg" .
"_____4861_gggggcgctc_aggtccggac_cggctcgtag_gccgctcacg_ccgttgcagc_tgctcgtcat" .
"_____4921_tagctctcgg_gagccgagct_cggggcggcc_ccatagagga_cgcccgcaat_ccgacggcta" .
"_____4981_ccgtgcattt_tttaaatggt_ttccctgcag_ccgggtggat_ggatgcgacg_ctgttcgagc" .
"_____5041_caggagccgg_ctcagcgggc_ccggagcgcg_cgagtccgcg_ccccccacta_ggtgtgggtg" .
"_____5101_gagccgagcg_cgcgacgaga_gccggcggaa_tgcgggccgc_gggtgggcct_ggggccagcc" .
"_____5161_gatttcagac_accgttttcc_tctttgcgtt_tcaaacagtg_aggtaccact_ggccaaggct" .
"_____5221_ggagaacaga_tgcgattatg_tgtaccgcgc_cctttgtggc_cctgcaattg_ctcggcatct" .
"_____5281_agctgagagt_aaaagccaaa_gctttgaccg_cagccccaag_gccgtgcgcg_cggtggggag" .
"_____5341_gggaaggggg_gaggaagctc_ctaggagaat_gatcccaaag_ccagcattac_tggaaaagtt" .
"_____5401_cattcagcaa_atctgtgtca_ggtacaaagt_gcccggcacg_atgattcaaa_aggtgcgcgt" .
"_____5461_ttctgaagct_taa" .
"//" .
"" .
"?????????????????????????????xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" .
"yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy";

my @ifiles = ($raw1, $raw2, $raw3);

my @ofiles = qw(good.1.txt good.2.txt good.3.txt);
my @amino = (
   ["         1 VTSL*NTSRQ STTRTIS*RI VMLPSVSRTR FSFE*RSS*Y RGVFTTKTTR TVSISLIETL",
    "        61 TKSLYVRT*I YTQMSWKMSY NIGNDTTILT KINLRNMLGC HN",
    "40396.8500"
   ],
   ["         1 TDVSVVVQRV PAVVPHTTQE ERRPPDRCTP SGVFWKGGPG GSRGPL*SSL SVGRYNQSTV",
    "        61 QTREGRRVSP LHIPVKRGVT SRGTTPEVPV EEVARVLRSG TSLDVYDAKT MSEGDSQQSR",
    "       121 VTGRPVAVVS RYTLWKRESG RPGVPKPSSL ALEQDVEGLE DTVHGR*VPP PPGTCIQETS",
    "       181 RVPVAL*GPA ERRPGTVGAS LDVYEAEKGT ERDTHQFELT G*RTKTVSFG KFINRKWVTW",
    "       241 FEVLAIGVCG RTRLTLESPV LGKVVGGEER GSSDHEVVFF TTTLPGSRTS LVLSLVAPKT",
    "       301 TCSGSPPQYA Y*PSDTKVCL FLVSGKTLRV LWGLSMVVHV S*RFTTRV*V STEDRCSWCQ",
    "       361 SGTPLEDPSV VGTEFWPNGR GYMVVDLRLP *SEVESRSEK ECGA*TCTER ERMFTDSRGD",
    "       421 GRPLFCVRKR IGC*EVK*TG DGWRGWIDRM KDQMDSDVSV TP*VLRFVCS PTENCVVNLC",
    "       481 TTRWREV**K VGRRSSF*MF KKFIKVTSKG RKFICTDGS",
    "200904.0300"
   ],
   ["         1 DS*KYLLW*G LKVLLTPMRG TGVVMRTPLT IRVSGGLGRR RR*GKWTMLM FLGREITCLS",
    "        61 SSPLDGKPDI PTIKPKCRTG IGVGS*LSSV S*LSIGTVTT RSSAVWSEQR PAGPFLRIAK",
    "       121 VPLFMRLVYT CFTLLLQSHI *KSLKVRVIR T*KVNSRLVM ECIREVGQTR WCLFETLV*M",
    "       181 RCCFIGSRIG YTGCFGTSYV RYKGRKFNML CRCLRRS*P* FRVTTSTKLF GCTIISKTKQ",
    "       241 QTVKTISSTT IRICTEFTAD GCVPRVRFIT ATSKKLLLLT T*KRELQRCR SHKGTTFTTL",
    "       301 RFS*FWWKLR CQSQRWNK*W SSTRWSVEQS KRSFFCFLRF LLL*SVPTFS GLTLSTLHTM",
    "       361 VIER*VPELI *MQF*KSTFQ KSMPGRSPMR KTMPFIVTKS FTMRKITRHG SCLKFLWVMR",
    "       421 CPTFGG*FTT CHK*RRSCLS *GRSFSSRTK CCLVKSTMLC RGLKTPCLGR CP*CCPWMYT",
    "       481 TSP*PT*PTL TRLSLS*SMT FPRKKFSSSS ISIRKLFFFC SKNGCPPTPT MSSIIWSKSP",
    "       541 LPKMPFTQFR S*LPIVTRSS PSFSPESPKT LSPKSEVFFR TSLVCYITTW MKTRSPSMMT",
    "       601 FRI*MWSFGR TLRIFFQTRT RKFLTLLCFT FI*PS*IWFT FV*PSLF*IT FIQSMILTLC",
    "       661 LSSWICLTLV LLT*VRFTLV VSARICLTFI *QTVFWFTVV CFITI*SLSF QFWTLGFRFP",
    "       721 TFGWTLRFCF LTPRRTLGFR FPATCRTLRF RLSTPGWTLR FRFFTSSRTL WFCICTFILP",
    "       781 RTFW*LSLFW TLQICICPMI *AKWSQF*SF STSEFRLWTT R*TKTQ*FCT GTIICFQSTV",
    "       841 LT*TRCSSTS *IPSFWSL*L *EIIFTCTVI *TTKFWTI*S FFCVCT*SPE FPF*QKTPRL",
    "       901 *FWTVRSTIC SSKII*FWTI RTKI*WFIIS TVFLSSVVLI LSVIILRGTV IPS*RFNKQP",
    "       961 PVQTT*LFKT VRFLVLPIST VTMSPLFLLP LLSSRLSVSS FLP*STSRFI SSIRTSTRRF",
    "      1021 *QKPTTSL*M ISISPI*FFK GIWMVLIW*F *FISIMSS*S QFS*WGT*GP SLT*MVR*NT",
    "      1081 CTLLLICVRI VSITFRFYTT LVKSTSITIT TSKT*EILCC IFSTTISNPY TSRTVFFETP",
    "      1141 SILFTGESTS FFLKPTTSNS FGFR*SKTVP SNKRRRVGIT PTIFLLLFSF CLLRLSNTWF",
    "      1201 *LWTSLLPKK LKIL*VSELS FMKPIKSSMP KMT*TTTTTL GSP*RESFCS RIT*AVT*TI",
    "      1261 LISLPMLPIR KVTVLTLSGF MEPLLMSSTQ FREVKQFSMR RPGAGRERRP GCGGAGGPSS",
    "      1321 GQGRWPRPAL SHVLVAVGPA DGGLSSLEI* AGTSSGPRRF LCRPSPRSSS LRLLDRGGGG",
    "      1381 GGFISRP*MD HAPCTSRPPS GRLFCLATKK KEEEEEEGVS L*AFVGWSPG SMAPP*RRPG",
    "      1441 PWLGGQPPPQ GGTPNHHSPL SHGCLPPPPP APPFPRDTHR EREQGREGAS CFTAGLHVDV",
    "      1501 LTEGGGRGL* LLVGEKG*GE GGGGAAAVVK SSAGAGAA*R AGRGEAWRGA GPPPAVGRLS",
    "      1561 SATKRRRGKR RSPADTYNGK *QLGCIAAKA TPCLPGPEGQ EMKGPPAGLA RGSSHHQHTH",
    "      1621 PPRVQAWPSI RRVRQRRRAV IESPRLEPRR GISCGR*AAD GT*KIYQRDV GPPTYAATSS",
    "      1681 VLGRVARASR AQARGVIHTH LGSRAALGRL TPGAHPDPGR LKSVAKGETQ SLSLHGDRFR",
    "      1741 PLVYANTHGA GNTGTLTSRR STLIFGFETG VGVPARAPPL PFPPPSRILL LGFRS**PFQ",
    "      1801 VSRLDTVHVS RAVLLSFPRA KTSN",
    "718618.2100"
   ],
);

my %msgs =  (
   0=>"Failed on test 1! Program does not sequence all 102 amino acids correctly...",
   1=>"Failed on test 2! Fails with a file containing the drosophila genome...",
   2=>"Failed on test 3! Fails when processing alpha & beta insulin peptide chains...",
);

my %prompts = (
   0=>"Test #1 Attempting to sequence 102 RANDOM amino acids...",
   1=>"Test #2 Attempting to sequence the drosophila genome...",
   2=>"Test #3 Attempting to sequence the alpha & beta insulin chains...",
);

my ($i, $rv, $err, $pname, $rawDna);

my $inFile;
my $outFile;

for($i=$err=0; $i<3; $i++) {
   $rawDna = $ifiles[$i];
   $pname = sprintf("perl %s %s > %s", $ARGV[0], $rawDna, $ofiles[$i]);

   print "$prompts{$i}\nPress the ENTER key to continue...";
   <STDIN>;

   system("$pname");

   $rv = test($ofiles[$i], $msgs{$i}, \@{$amino[$i]});
   if(!$rv) {
      $err = 1;
      last;
   }
   else {
      print "\nPassed TEST #", $i+1, " Press the ENTER key to continue...\n";
      <STDIN>;
   }
}
if(!$err) {
   print "\nCongratulations! Your program passed all tests!!!\n";
   print "Please submit your assignment...\n";
   print "Don't forget to read my 'assignment standards' before submitting!\n";
   print "Even Larry Wall would be proud of you right now! :-)\n\n";
}
else {
   print "You passed $i out of 3 tests!\nKeep at it!\n";
}

sub test {
   my @good_amino = @{$_[2]};
   my $fname = shift;
   my $msg = shift;
   my ($rc, @data, $i, $j, $k);

   open(FD, "$fname") || die("$!\n");
   while(<FD>) {
      chomp($_);
      push(@data, $_);
   }
   close(FD);

   $rc = 1;
   my ($offset, $caretPos);
   for($i=0, $k=0; $i<$#data && $rc; $i++) {
      $offset = 0;
      $caretPos = 1;
      if($good_amino[$i] ne $data[$i]) {
         print "\n\n*$msg*\n\n";
         print "mismatch detected on line: ", $i+1;
         for($j=0; $j<length($good_amino[$i]); $j++) {
            if(substr($good_amino[$i], $j, 1) eq " ") {
               $offset++;
            }
            if(substr($good_amino[$i], $j, 1) eq " " && $j > 9) {
               $caretPos++;
            }

            if(substr($good_amino[$i], $j, 1) ne substr($data[$i], $j, 1)) {
               last;
            }
         }
         print " at amino acid number: ", $j-$offset, "\n";
         $caretPos = $j - $offset + 27 + $caretPos;
         for($k=0; $k<$caretPos; $k++) {
            print " ";
         }
         print "|\n";
         print "correct sequence: '$good_amino[$i]'\n";
         print "your sequence:    '$data[$i]'\n";
         for($k=0; $k<$caretPos; $k++) {
            print " ";
         }
         print "|\n";
         if($j == length($good_amino[$i]) || $j == length($good_amino[$i])-1) {
            print "Could be you're missing a ' ' at the end or the beginning of the line...\n\n";
         }
         $rc = 0;
         last;
      }
   }
   if($rc) {
      if($data[-1] != $good_amino[-1]) {
         print "\n\n*$msg*\n\n";
         print "Incorrect molecular weight detected!\n";
         print "correct mol. wt. : $good_amino[-1]\n";
         print "your    mol wt.  : $data[-1]\n\n";
         $rc = 0;
      }
   }
   return $rc;
}