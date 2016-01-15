SetPackageInfo( rec(

PackageName := "cohomolo",
Subtitle := "Cohomology groups of finite groups on finite modules",
Version := "1.6.1",
Date := "14/01/2016",

Persons := [
  rec(
    LastName := "Holt",
    FirstNames := "Derek",
    IsAuthor      := true,
    IsMaintainer  := false,
    Email := "D.F.Holt@warwick.ac.uk",
    WWWHome := "http://homepages.warwick.ac.uk/staff/D.F.Holt/",
    PostalAddress := Concatenation( [
                       "Mathematics Institute\n",
                       "University of Warwick\n",
                       "Coventry CV4 7AL\n", "UK" ] )
  ),
  rec(
    LastName      := "Horn",
    FirstNames    := "Max",
    IsAuthor      := false,
    IsMaintainer  := true,
    Email         := "max.horn@math.uni-giessen.de",
    WWWHome       := "http://www.quendi.de/math",
    PostalAddress := Concatenation(
                       "AG Algebra\n",
                       "Mathematisches Institut\n",
                       "Justus-Liebig-Universität Gießen\n",
                       "Arndtstraße 2\n",
                       "35392 Gießen\n",
                       "Germany" ),
    Place         := "Gießen",
    Institution   := "Justus-Liebig-Universität Gießen"
  ),
  rec(
    LastName      := "Pfeiffer",
    FirstNames    := "Markus",
    IsAuthor      := false,
    IsMaintainer  := true,
    Email         := "markusp@mcs.st-andrews.ac.uk",
    WWWHome       := "http://www.morphism.de/~markusp",
    PostalAddress := Concatenation( [
                       "School of Computer Science\n",
                       "University of St Andrews\n",
                       "Jack Cole Building, North Haugh\n",
                       "St Andrews, Fife, KY16 9SX\n",
                       "United Kingdom" ] ),
    Place         := "St Andrews",
    Institution   := "University of St Andrews"
  ),
],

Status := "accepted",
CommunicatedBy := "unknown (unknown)",
AcceptDate     := "01/1970",   # unknown, package might predate refereeing system

SourceRepository := rec(
    Type := "git",
    URL := Concatenation( "https://github.com/gap-packages/", ~.PackageName ),
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := Concatenation( "https://gap-packages.github.io/", ~.PackageName ),
README_URL      := Concatenation( ~.PackageWWWHome, "/README" ),
PackageInfoURL  := Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),
ArchiveURL      := Concatenation( ~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/", ~.PackageName ,"-", ~.Version ),
ArchiveFormats := ".tar.gz",

AbstractHTML :=
  "The <span class=\"pkgname\">cohomolo</span> package is a\
       <span class=\"pkgname\">GAP</span> interface to some `C' programs\
   for computing Schur multipliers and covering groups of finite groups\
   and first and second cohomology groups of finite groups acting\
   on finite modules",


PackageDoc := rec(
  BookName  := "cohomolo",
  ArchiveURLSubset := ["doc", "htm"],
  HTMLStart := "htm/chapters.htm",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Computing Cohomology groups and Schur Multipliers",
  Autoload  := true
),


Dependencies := rec(
  GAP := ">=4.7",
  NeededOtherPackages := [],
  SuggestedOtherPackages := [],
  ExternalConditions := ["Unix only"]
),

AvailabilityTest := function()
  local path,file;
    # test for existence of the compiled binary
    path:=DirectoriesPackagePrograms("cohomolo");
    file:=Filename(path,"extprun");
    if file=fail then
      Info(InfoWarning,1,
 "Package ``cohomolo'': The program `extprun' (for example) is not compiled");
      Info(InfoWarning,1,
        "`cohomolo' is thus unavailable");
      Info(InfoWarning,1,
        "See the installation instructions; ",
        "type: ?Installing the package");
      return fail;
    fi;
    return true;
  end,

Autoload := false,

Keywords := [
  "Cohomology",
  "Schur Multiplier",
  "Covering group"
],

#TestFile := "tst/testall.g",

));
