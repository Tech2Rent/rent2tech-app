#!/bin/bash
# RENT2TECH - Setup Initialization Script
# Esegui questo script per inizializzare il progetto localmente

echo "🚀 RENT2TECH - SETUP INIZIALE"
echo "======================================"
echo ""

# Controlla se Node.js è installato
if ! command -v node &> /dev/null; then
    echo "❌ Node.js non trovato!"
    echo "Scarica da: https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js trovato: $(node --version)"
echo ""

# Controlla se npm è installato
if ! command -v npm &> /dev/null; then
    echo "❌ npm non trovato!"
    echo "Installa Node.js da: https://nodejs.org/"
    exit 1
fi

echo "✅ npm trovato: $(npm --version)"
echo ""

# Controlla se Git è installato
if ! command -v git &> /dev/null; then
    echo "❌ Git non trovato!"
    echo "Scarica da: https://git-scm.com/"
    exit 1
fi

echo "✅ Git trovato: $(git --version)"
echo ""

# Copia .env file
if [ ! -f ".env.local" ]; then
    if [ -f ".env.local-example" ]; then
        cp .env.local-example .env.local
        echo "✅ File .env.local creato da .env.local-example"
        echo "⚠️  Modifica .env.local con le tue credenziali Supabase"
    else
        echo "⚠️  .env.local-example non trovato"
    fi
else
    echo "✅ File .env.local esiste già"
fi

echo ""

# Installa dipendenze
echo "📦 Installazione dipendenze npm..."
npm install

if [ $? -ne 0 ]; then
    echo "❌ Errore durante npm install"
    exit 1
fi

echo ""
echo "✅ Setup completato!"
echo ""
echo "=========================================="
echo "PROSSIMI STEP:"
echo "=========================================="
echo ""
echo "1️⃣  Configura Supabase:"
echo "   • Vai su https://supabase.com"
echo "   • Sign Up con info@rent2tech.it"
echo "   • Crea progetto 'rent2tech-app'"
echo "   • Copia URL e Anon Key"
echo ""
echo "2️⃣  Modifica file .env.local:"
echo "   • Incolla credenziali Supabase"
echo "   • Salva il file"
echo ""
echo "3️⃣  Esegui SQL script in Supabase:"
echo "   • Apri Supabase SQL Editor"
echo "   • Copia contenuto da: database-setup.sql"
echo "   • Esegui il codice SQL"
echo ""
echo "4️⃣  Avvia dev server:"
echo "   • npm run dev"
echo "   • App si aprirà su http://localhost:3000"
echo ""
echo "5️⃣  Deploy su Vercel:"
echo "   • Crea repo GitHub: rent2tech-app"
echo "   • git add . && git commit -m 'Initial'"
echo "   • git push origin main"
echo "   • Vai su vercel.com e importa repo"
echo "   • Aggiungi env vars Supabase"
echo ""
echo "📚 Per più dettagli leggi: GUIDA-Setup.md"
echo ""