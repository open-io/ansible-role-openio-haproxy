from six import string_types

class FilterModule(object):
    def filters(self):
        return {
            'list_backends': self.list_backends,
        }

    def list_backends(self, list_backends, name, active=0, check="0"):
        backends = list()

        if isinstance(list_backends, string_types):
            list_backends = list_backends.split()

        for index, backend in enumerate(list_backends):
            res = name + str(index + 1) + " " + backend
            if check != "0":
                res +=  " check inter " + str(check)
            if active != 0 and index + 1 > active:
                res += " backup"
            backends.append(res)
        return backends
