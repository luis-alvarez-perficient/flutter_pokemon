abstract class Mapper<DTOS, Entity> {
  Entity fromDTO(DTOS dto);

  DTOS toDTO(Entity entity);

  List<Entity> fromDTOList(List<DTOS> dtos) {
    return dtos.map((dto) => fromDTO(dto)).toList();
  }

  List<DTOS> toDTOList(List<Entity> domainModels) {
    return domainModels.map((entity) => toDTO(entity)).toList();
  }
}
