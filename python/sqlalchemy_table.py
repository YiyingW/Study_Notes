from sqlalchemy import create_engine
engine = create_engine('sqlite:///census_nyc.sqlite')
connection = engine.connect()

from sqlalchemy import MetaData
metadata = MetaData()

# create table
from sqlalchemy import (Table, Column, String, Integer, Float, Boolean)
employees = Table('employees', metadata,
                  Column('id', Integer()),
                  Column('name', String(255), unique=True, nullable=False),
                  Column('salary', Float(), default=100.00),
                  Column('active', Boolean(), default=True)
                  )
metadata.create_all(engine)

# insert to table
from sqlalchemy import insert

stmt = insert(employees).values(id=1, name='Jason', salary=1.00, active=True)
result_proxy = connection.execute(stmt)
print result_proxy.rowcount

# insert multiple rows
stmt = insert(employees)
values_list = [
    {'id': 2, 'name': 'Rebecca', 'salary': 2.00, 'active': True},
    {'id': 3, 'name': 'Bob', 'salary': 2.00, 'active': True}
]
result_proxy = connection.execute(stmt, values_list)
print result_proxy.rowcount

# have a look at the table
from sqlalchemy import select
stmt = select([employees])
print connection.execute(stmt).fetchall()

# update data
from sqlalchemy import update

stmt = update(employees)
stmt = stmt.where(employees.columns.active == True)
stmt = stmt.values(active=False, salary = 0.00)
result_proxy = connection.execute(stmt)
