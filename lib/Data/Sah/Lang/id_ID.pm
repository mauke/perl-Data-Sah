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

    q[%(modal_verb_be)sat least %s],
    q[%(modal_verb_be)sminimal %s],

    q[%(modal_verb_be)slarger than %s],
    q[%(modal_verb_be)slebih besar dari %s],

    q[%(modal_verb_be)sat most %s],
    q[%(modal_verb_be)smaksimal %s],

    q[%(modal_verb_be)ssmaller than %s],
    q[%(modal_verb_be)slebih kecil dari %s],

    q[%(modal_verb_be)sbetween %s and %s],
    q[%(modal_verb_be)santara %s dan %s],

    q[%(modal_verb_be)slarger than %s and smaller than %s],
    q[%(modal_verb_be)slebih besar dari %s dan lebih kecil dari %s],

    # type: Comparable

    q[%(modal_verb_be)s%s],
    q[%(modal_verb_be)s%s],

    q[%(modal_verb_be)sone of %s],
    q[%(modal_verb_be)ssalah satu dari %s],

    # type: HasElems

    # type: num

    q[number],
    q[bilangan],

    q[numbers],
    q[bilangan],

    # type: int

    q[integer],
    q[bilangan bulat],

    q[integers],
    q[bilangan bulat],

    q[%(modal_verb_be)sdivisible by %s],
    q[%(modal_verb_be)sdapat dibagi %s],

    q[%(modal_verb)sleave a remainder of %2$s when divided by %1$s],
    q[jika dibagi %1$s %(modal_verb)smenyisakan %2$s],

    # type: float

    q[%(modal_verb_be)sa NaN],
    q[%(modal_verb_be)sNaN],

    q[%(modal_verb_not_be)sa NaN],
    q[%(modal_verb_not_be)sNaN],

    q[%(modal_verb_be)san infinity],
    q[%(modal_verb_be)stak hingga],

    q[%(modal_verb_not_be)san infinity],
    q[%(modal_verb_not_be)stak hingga],

    q[%(modal_verb_be)sa positive infinity],
    q[%(modal_verb_be)spositif tak hingga],

    q[%(modal_verb_not_be)sa positive infinity],
    q[%(modal_verb_not_be)spositif tak hingga],

    q[%(modal_verb_be)s a negative infinity],
    q[%(modal_verb_be)snegatif tak hingga],

    q[%(modal_verb_not_be)sa negative infinity],
    q[%(modal_verb_not_be)snegatif tak hingga],

);

1;
# ABSTRACT: id_ID locale

=for Pod::Coverage .+
