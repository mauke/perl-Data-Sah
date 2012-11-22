package Data::Sah::Lang::id_ID;

# VERSION

our %translations;

%translations = (

    # modal verbs

    q[must ],
    q[harus ],

    q[must be ],
    q[harus ],

    q[must not ],
    q[tidak boleh ],

    q[must not be ],
    q[tidak boleh ],

    q[should ],
    q[sebaiknya ],

    q[should be ],
    q[sebaiknya ],

    q[should not ],
    q[sebaiknya tidak ],

    q[should not be ],
    q[sebaiknya tidak ],

    # multi

    q[%s and %s],
    q[%s dan %s],

    q[%s or %s],
    q[%s atau %s],

    q[one of %s],
    q[salah satu dari %s],

    q[all of %s],
    q[semua nilai-nilai %s],

    q[%(modal_verb)ssatisfy all of the following],
    q[%(modal_verb)smemenuhi semua ketentuan ini],

    q[%(modal_verb)ssatisfy one of the following],
    q[%(modal_verb)smemenuhi salah satu ketentuan ini],

    q[%(modal_verb)ssatisfy between %d and %d of the following],
    q[%(modal_verb)smemenuhi antara %d hingga %d ketentuan ini],

    # type: BaseType

    # type: Sortable

    # type: Comparable

    # type: HasElems

    # type: num

    # type: int

    q[integer],
    q[bilangan bulat],

    q[integers],
    q[bilangan bulat],

    q[%(modal_verb_be)sdivisible by %s],
    q[%(modal_verb_be)sdapat dibagi %s],

    q[%(modal_verb)sleave a remainder of %2$s when divided by %1$s],
    q[jika dibagi %1$s %(modal_verb)smenyisakan %2$s],
);

1;
# ABSTRACT: id_ID locale

=for Pod::Coverage .+
