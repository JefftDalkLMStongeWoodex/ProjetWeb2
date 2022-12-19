<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>PDF</title>
<style>
    ul {
        list-style-type: none;
    }
</style>
</head>
<body>
    <header>
        <h1>Facture pour achat de véhicule(s)</h1>
        <ul>
            <li>VDO INC</li>
            <li>3800 R. Sherbrooke E</li>
            <li>Montréal, QC</li>
            <li>H1X 2A2</li>
            <li>(514) 254-7131</li>
        </ul>
    </header>
    <hr>
    <main>
        <div>
            <h2>Facturé à</h2>
            <ul>
                <li>{{ $user_nom }}</li>
                <li>{{ $user_adresse }}</li>
                <li>{{ $user_code_postal }}</li>
                <li>{{ $user_telephone }}</li>
                <li>{{ $user_email }}</li>
            </ul>
        </div>
        <div>
            <h2>Détail de la commande</h2>
            {!! $domVoitures !!}
        </div>
        <div>
            <ul>
                <li>Sous-total: {{ $montantTotal }}
                {!! $domTaxes !!}
                <li>Total: {{ $montantApresTaxe }}</li>
            </ul>
        </div>
    </main>
    <hr>
    <section>
        <h5>Notes</h5>
        <p>Un dépot de 40% est requis pour l'avancement du projet.</p>
    </section>
</body>
</html>