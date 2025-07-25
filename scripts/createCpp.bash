#!/bin/bash

createCpp()
{
CLASSNAME=$1
DIR=${2:-""} 

cat <<EOF > "${DIR}${CLASSNAME}.cpp"
#include "${CLASSNAME}.hpp"
#include <iostream>

$CLASSNAME::$CLASSNAME()
{
	std::cout << "$CLASSNAME's default constructor called" << std::endl;
} 
 
$CLASSNAME &$CLASSNAME::operator=(const $CLASSNAME &other)
{ 
	std::cout << "$CLASSNAME's Copy assignment operator called" << std::endl;

	//here you copy your class atribuites...

	return (*this);
} 
 
$CLASSNAME::$CLASSNAME(const $CLASSNAME &other)
{ 
	std::cout << "$CLASSNAME's copy constructor operator called" << std::endl;
 
	*this = other;
}

$CLASSNAME::~$CLASSNAME()
{ 
	std::cout << "$CLASSNAME's default destructor called" << std::endl;
}
EOF
}

createCpp "$1" "$2"
