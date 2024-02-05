xquery version "1.0" encoding "utf-8";

for $b in doc("employe.xml")//employe
    where $b/nom="Dupond"
    return

