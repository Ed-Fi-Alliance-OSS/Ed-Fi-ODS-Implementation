SET XACT_ABORT ON 
begin transaction;


INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/TestDescriptionDescriptor','DDA','Dual Discrepancy Model Assessment','Dual Discrepancy Model Assessment');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/TestDescriptionDescriptor','EARLY CHILDHOOD','Early Childhood Assessment','Early Childhood Assessment');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/TestDescriptionDescriptor','HL','Home/Heritage Language (language other than','Home/Heritage Language (language other than');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/TestDescriptionDescriptor','NMELPAPT','ENGLISH LANGUAGE PROFICIENCY SCREENER','ENGLISH LANGUAGE PROFICIENCY SCREENER');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/TestDescriptionDescriptor','LUS','Language Usage Survey','Language Usage Survey');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/TestDescriptionDescriptor','SAT','Student Assistance Team referral','Student Assistance Team referral');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/TestDescriptionDescriptor','EOC','End of Course Exams','End of Course Exams');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/TestDescriptionDescriptor','DYS','Dyslexia Screening','Dyslexia Screening');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/TestDescriptionDescriptor','ELPKS','English Language Proficiency Kindergarten Screener','English Language Proficiency Kindergarten Screener');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/TestDescriptionDescriptor','ACCU','Accuplacer Test','Accuplacer Test');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/TestDescriptionDescriptor','AP','Advanced Placement','Advanced Placement');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/TestDescriptionDescriptor','COMP','Compass Test','Compass Test');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/TestDescriptionDescriptor','IB','International Baccalaureate','International Baccalaureate');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/TestDescriptionDescriptor','ACT','ACT PLAN','ACT PLAN');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/TestDescriptionDescriptor','TABE','Test of Adult Basic Education','Test of Adult Basic Education');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/TestDescriptionDescriptor','KEYS','Work Keys','Work Keys');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/TestDescriptionDescriptor','ASVAB','Armed Services Vocational Aptitude Battery','Armed Services Vocational Aptitude Battery');
INSERT INTO nmassessments.TestDescriptionDescriptor (TestDescriptionDescriptorId)
SELECT descriptorId FROM edfi.descriptor
where namespace = 'uri://nmped.org/nmassessments/TestDescriptionDescriptor';




INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/nmassessments/StandardAchievedCodeDescriptor','0','0','0');
INSERT INTO nmassessments.StandardAchievedCodeDescriptor (StandardAchievedCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/nmassessments/StandardAchievedCodeDescriptor','1','1','1');
INSERT INTO nmassessments.StandardAchievedCodeDescriptor (StandardAchievedCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/nmassessments/StandardAchievedCodeDescriptor','Y','Y','Y');
INSERT INTO nmassessments.StandardAchievedCodeDescriptor (StandardAchievedCodeDescriptorId) values (@@IDENTITY);
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) 
values ('uri://nmped.org/nmassessments/StandardAchievedCodeDescriptor','N','N','N');
INSERT INTO nmassessments.StandardAchievedCodeDescriptor (StandardAchievedCodeDescriptorId) values (@@IDENTITY);





INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','SOCIAL EMOTIONAL ENTRY','SOCIAL EMOTIONAL ENTRY','SOCIAL EMOTIONAL ENTRY');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','LANGUAGE ACQUISITION ENTRY','LANGUAGE ACQUISITION ENTRY','LANGUAGE ACQUISITION ENTRY');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','BEHAVIOR ENTRY','BEHAVIOR ENTRY','BEHAVIOR ENTRY');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','SOCIAL EMOTIONAL EXIT','SOCIAL EMOTIONAL EXIT','SOCIAL EMOTIONAL EXIT');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','LANGUAGE ACQUISITION EXIT','LANGUAGE ACQUISITION EXIT','LANGUAGE ACQUISITION EXIT');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','BEHAVIOR EXIT','BEHAVIOR EXIT','BEHAVIOR EXIT');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','INSTRUMENT NOT SPANISH','INSTRUMENT NOT SPANISH','INSTRUMENT NOT SPANISH');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','NMELPAPT','NMELPAPT','NMELPAPT');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','LUS','LUS','LUS');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','SLDDDA','SLDDDA','SLDDDA');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','SAT','SAT','SAT');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','ART HISTORY','ART HISTORY','ART HISTORY');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','BIOLOGY','BIOLOGY','BIOLOGY');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','CALCULUS AB','CALCULUS AB','CALCULUS AB');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','CALCULUS BC','CALCULUS BC','CALCULUS BC');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','CHEMISTRY','CHEMISTRY','CHEMISTRY');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','CHINESE LANGUAGE AND CULTURE','CHINESE LANGUAGE AND CULTURE','CHINESE LANGUAGE AND CULTURE');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','COMPUTER SCIENCE A','COMPUTER SCIENCE A','COMPUTER SCIENCE A');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','COMPUTER SCIENCE PRINCIPLES','COMPUTER SCIENCE PRINCIPLES','COMPUTER SCIENCE PRINCIPLES');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','ENGLISH LANGUAGE AND COMPOSITION','ENGLISH LANGUAGE AND COMPOSITION','ENGLISH LANGUAGE AND COMPOSITION');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','ENGLISH LITERATURE AND COMPOSITION','ENGLISH LITERATURE AND COMPOSITION','ENGLISH LITERATURE AND COMPOSITION');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','ENVIRONMENTAL CIENCE','ENVIRONMENTAL CIENCE','ENVIRONMENTAL CIENCE');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','EUROPEAN HISTORY','EUROPEAN HISTORY','EUROPEAN HISTORY');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','FRENCH LANGUAGE','FRENCH LANGUAGE','FRENCH LANGUAGE');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','GERMAN LANGUAGE','GERMAN LANGUAGE','GERMAN LANGUAGE');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','GOVERNMENT AND POLITICS: COMPARATIVE','GOVERNMENT AND POLITICS: COMPARATIVE','GOVERNMENT AND POLITICS: COMPARATIVE');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','GOVERNMENT AND POLITICS: UNITED STATES','GOVERNMENT AND POLITICS: UNITED STATES','GOVERNMENT AND POLITICS: UNITED STATES');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','HUMAN GEOGRAPHY','HUMAN GEOGRAPHY','HUMAN GEOGRAPHY');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','ITALIAN LANGUAGE AND CULTURE','ITALIAN LANGUAGE AND CULTURE','ITALIAN LANGUAGE AND CULTURE');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','JAPANESE LANGUAGE AND CULTURE','JAPANESE LANGUAGE AND CULTURE','JAPANESE LANGUAGE AND CULTURE');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','LATIN: VERGIL','LATIN: VERGIL','LATIN: VERGIL');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','MACROECONOMICS','MACROECONOMICS','MACROECONOMICS');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','MICROECONOMICS','MICROECONOMICS','MICROECONOMICS');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','MUSIC THEORY','MUSIC THEORY','MUSIC THEORY');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','PHYSICS 1: ALGEBRA-BASED','PHYSICS 1: ALGEBRA-BASED','PHYSICS 1: ALGEBRA-BASED');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','PHYSICS 2: ALGEBRA-BASED','PHYSICS 2: ALGEBRA-BASED','PHYSICS 2: ALGEBRA-BASED');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','PHYSICS C: ELECTRICITY AND MAGNETISM','PHYSICS C: ELECTRICITY AND MAGNETISM','PHYSICS C: ELECTRICITY AND MAGNETISM');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','PHYSICS C: MECHANICS','PHYSICS C: MECHANICS','PHYSICS C: MECHANICS');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','PSYCHOLOGY','PSYCHOLOGY','PSYCHOLOGY');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','RESEARCH','RESEARCH','RESEARCH');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','SEMINAR','SEMINAR','SEMINAR');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','SPANISH LANGUAGE','SPANISH LANGUAGE','SPANISH LANGUAGE');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','SPANISH LITERATURE','SPANISH LITERATURE','SPANISH LITERATURE');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','STATISTICS','STATISTICS','STATISTICS');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','STUDIO ART:  2-D DESIGN','STUDIO ART:  2-D DESIGN','STUDIO ART:  2-D DESIGN');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','STUDIO ART: 3-D DESIGN','STUDIO ART: 3-D DESIGN','STUDIO ART: 3-D DESIGN');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','STUDIO ART: DRAWING','STUDIO ART: DRAWING','STUDIO ART: DRAWING');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','US HISTORY','US HISTORY','US HISTORY');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','WORLD HISTORY','WORLD HISTORY','WORLD HISTORY');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','ENGLISH','ENGLISH','ENGLISH');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','MATH','MATH','MATH');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','READING','READING','READING');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','SCIENCE','SCIENCE','SCIENCE');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','ELEMENTARY ALGEBRA','ELEMENTARY ALGEBRA','ELEMENTARY ALGEBRA');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','COLLEGE-LEVEL MATH','COLLEGE-LEVEL MATH','COLLEGE-LEVEL MATH');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','READING COMPREHENSION','READING COMPREHENSION','READING COMPREHENSION');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','WRITEPLACER','WRITEPLACER','WRITEPLACER');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','SENTENCE SKILLS','SENTENCE SKILLS','SENTENCE SKILLS');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','MATHEMATICS','MATHEMATICS','MATHEMATICS');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','WRITING','WRITING','WRITING');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','WRITING SKILLS','WRITING SKILLS','WRITING SKILLS');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','WRITING ESSAY (SCALE 2-12)','WRITING ESSAY (SCALE 2-12)','WRITING ESSAY (SCALE 2-12)');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','WRITING ESSAY (SCALE 2-8)','WRITING ESSAY (SCALE 2-8)','WRITING ESSAY (SCALE 2-8)');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','LANGUAGE A','LANGUAGE A','LANGUAGE A');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','LANGUAGE B','LANGUAGE B','LANGUAGE B');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','INDIVIDUALS  AND SOCIETY','INDIVIDUALS  AND SOCIETY','INDIVIDUALS  AND SOCIETY');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','EXPERIMENTAL SCIENCES','EXPERIMENTAL SCIENCES','EXPERIMENTAL SCIENCES');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','ARTS','ARTS','ARTS');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','DIPLOMA','DIPLOMA','DIPLOMA');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','READING AND WRITING','READING AND WRITING','READING AND WRITING');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','LANGUAGE','LANGUAGE','LANGUAGE');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','READING FOR INFORMATION','READING FOR INFORMATION','READING FOR INFORMATION');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','APPLIED MATHEMATICS','APPLIED MATHEMATICS','APPLIED MATHEMATICS');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','LOCATING INFORMATION','LOCATING INFORMATION','LOCATING INFORMATION');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','APPLIED TECHNOLOGY','APPLIED TECHNOLOGY','APPLIED TECHNOLOGY');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','TEAMWORK','TEAMWORK','TEAMWORK');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','LISTENING','LISTENING','LISTENING');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','AFQT','AFQT','AFQT');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','LITERATURE','LITERATURE','LITERATURE');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','MATH LEVEL 1','MATH LEVEL 1','MATH LEVEL 1');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','MATH LEVEL 2','MATH LEVEL 2','MATH LEVEL 2');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','ECOLOGICAL BIOLOGY','ECOLOGICAL BIOLOGY','ECOLOGICAL BIOLOGY');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','MOLECULAR BIOLOGY','MOLECULAR BIOLOGY','MOLECULAR BIOLOGY');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','PHYSICS','PHYSICS','PHYSICS');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','FRENCH','FRENCH','FRENCH');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','FRENCH WITH LISTENING','FRENCH WITH LISTENING','FRENCH WITH LISTENING');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','GERMAN','GERMAN','GERMAN');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','GERMAN WITH LISTENING','GERMAN WITH LISTENING','GERMAN WITH LISTENING');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','SPANISH','SPANISH','SPANISH');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','SPANISH WITH LISTENING','SPANISH WITH LISTENING','SPANISH WITH LISTENING');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','MODERN HEBREW','MODERN HEBREW','MODERN HEBREW');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','ITALIAN','ITALIAN','ITALIAN');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','LATIN','LATIN','LATIN');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','CHINESE WITH LISTENING','CHINESE WITH LISTENING','CHINESE WITH LISTENING');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','JAPANESE WITH LISTENING','JAPANESE WITH LISTENING','JAPANESE WITH LISTENING');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','KOREAN WITH LISTENING','KOREAN WITH LISTENING','KOREAN WITH LISTENING');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','ALGEBRA I 9 12 V001','ALGEBRA I 9 12 V001','ALGEBRA I 9 12 V001');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','DYS','DYS','DYS');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','ORAL LANGUAGE','ORAL LANGUAGE','ORAL LANGUAGE');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription], [Description]) values ('uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor','COMPOSITE OVERALL','COMPOSITE OVERALL','COMPOSITE OVERALL');



INSERT INTO nmassessments.ItemDescriptionCodeDescriptor (ItemDescriptionCodeDescriptorId) 
SELECT descriptorId FROM edfi.descriptor
where namespace = 'uri://nmped.org/nmassessments/ItemDescriptionCodeDescriptor';



INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/ScoringModelCodeDescriptor','BRIG','Brigance','Brigance');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/ScoringModelCodeDescriptor','CC','Creative Curriculum','Creative Curriculum');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/ScoringModelCodeDescriptor','WORK','Work Sampling','Work Sampling');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/ScoringModelCodeDescriptor','PETITION','Petition to NMPED','Petition to NMPED');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/ScoringModelCodeDescriptor','NMPKOA','NM Prek Observational Assessment','NM Prek Observational Assessment');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/ScoringModelCodeDescriptor','DLDSC','Dual Discrepancy Model Assessment','Dual Discrepancy Model Assessment');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/ScoringModelCodeDescriptor','TCHREAD','Teach Me to Read','Teach Me to Read');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/ScoringModelCodeDescriptor','LEXISE','Lexercise','Lexercise');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/ScoringModelCodeDescriptor','ISTAT','Istation','Istation');
INSERT INTO edfi.Descriptor ([Namespace], [CodeValue], [ShortDescription],Description) values ('uri://nmped.org/nmassessments/ScoringModelCodeDescriptor','IDEL','IDEL','IDEL');


INSERT INTO nmassessments.ScoringModelCodeDescriptor (ScoringModelCodeDescriptorId) 
SELECT descriptorId FROM edfi.descriptor
where namespace = 'uri://nmped.org/nmassessments/ScoringModelCode';



commit