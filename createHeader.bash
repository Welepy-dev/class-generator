#!/bin/bash

createHeader()
{
    CLASSNAME=$1
    DIR=${2:-""}

    cat <<EOF > "${DIR}${CLASSNAME}.hpp"
#ifndef ${CLASSNAME^^}_HPP
#define ${CLASSNAME^^}_HPP

class $CLASSNAME
{
    public:
        $CLASSNAME();
        $CLASSNAME(const $CLASSNAME &other);
        $CLASSNAME &operator=(const $CLASSNAME &other);
        ~$CLASSNAME();

    private:

};

#endif
EOF
}

createHeader "$1" "$2"

