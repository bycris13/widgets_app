import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InifiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_scroll';
  const InifiniteScrollScreen({super.key});

  @override
  State<InifiniteScrollScreen> createState() => _InifiniteScrollScreenState();
}

class _InifiniteScrollScreenState extends State<InifiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  // Controlador que permite escuchar el scroll del ListView
  final ScrollController scrollController = ScrollController();
  // Bandera que indica si se está cargando una nueva página
  bool isLoading = false;

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) {
      return;
    }
    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(microseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  // Función que agrega 5 nuevas imágenes al final de la lista
  void addFiveImages() {
    final lasId = imagesIds.last;

    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lasId + e));
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      // initState se ejecuta una sola vez cuando el widget se crea
      // Aquí se agrega un listener al scroll para detectar cuando el usuario se acerca al final
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        // load next page
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    // dispose se llama cuando el widget se elimina del árbol
    // Aquí se libera el controlador de scroll para evitar fugas de memoria
    scrollController.dispose();
    super.dispose();
  }

  Future loadNextPage() async {
    // Si ya se está cargando, no hace nada (evita duplicar cargas)
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    // Agrega nuevas imágenes
    addFiveImages();

    isLoading = false;
    // ✅ Esta línea evita que se llame setState si el widget ya fue desmontado
    // mounted es una propiedad de Flutter que indica si el widget sigue en el árbol
    // Si el widget ya fue eliminado, se sale de la función sin hacer nada
    if (!mounted) return;
    setState(() {});
    // TODO: mover scroll
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));

    final lastId = imagesIds.last;

    imagesIds.clear();

    imagesIds.add(lastId + 1);

    addFiveImages();
    isLoading = false;
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              final imageId = imagesIds[index];
              return FadeInImage(
                width: double.infinity,
                fit: BoxFit.cover,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                  'https://picsum.photos/id/$imageId/500/300',
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: isLoading
            ? const CircularProgressIndicator()
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
    );
  }
}
