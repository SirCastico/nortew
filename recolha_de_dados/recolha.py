import MySQLdb # pip install mysqlclient
import argparse, csv

# Conexão: host name password database

parser: argparse.ArgumentParser = argparse.ArgumentParser(
    'Recolha',
     description='Insere dados csv numa base de dados mysql')

parser.add_argument('-t','--table', required=False, help='nome da tabela onde dados serão inseridos')

parser.add_argument('-f','--filename', required=False, help='nome do ficheiro a ler')

parser.add_argument('-c', '--connection', nargs='+', required=False, help='argumentos de conexão para base de dados. Formato -> -c host user password database')

args: argparse.Namespace = parser.parse_args()


if args.table and args.filename and args.connection:
    with open(args.filename, newline='', encoding="UTF-8") as csv_file:
        csv_iter = csv.reader(csv_file)

        header = next(csv_iter)
        sql_q = f"INSERT INTO {args.table}({','.join(header)}) VALUES "

        for row in csv_iter:
            for i in range(len(row)):
                row[i] = "'" + row[i].strip() + "'"
            sql_q += f'({",".join(row)}),'
        
        sql_q = sql_q[:-1] + ';'

        print(sql_q)

        db: MySQLdb.Connection = MySQLdb.connect(*args.connection)

        cursor: MySQLdb.cursors.Cursor = db.cursor()

        cursor.execute(sql_q)

        db.commit()

        db.close()

else:
    parser.print_help()
